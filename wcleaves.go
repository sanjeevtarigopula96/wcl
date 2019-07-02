package services

import (
	"encoding/json"
	"sync"
	"time"

	//"github.com/Wanclouds/wcprofiles/gen/models"
	  //"github.com/go-openapi/errors"
	//"home/sanjeev/go/src/github.com/go-openapi"
	//"go/src/github.com/go-openapi/errors "
	"github.com/go-openapi/strfmt/"
	
	// "github.com/go-openapi/strfmt"
)

const layoutISO = "2006-01-02"

var (
	type1                        = "Sickleave"
	email1          strfmt.Email = "sanjeev@wanclouds.net"
	date1                        = "2019-06-05"
	t1, _                        = time.Parse(layoutISO, date1)
	datef1                       = strfmt.Date(t1)
	date2                        = "2019-06-05"
	t2, _                        = time.Parse(layoutISO, date2)
	datef2                       = strfmt.Date(t2)
	approvalstatus1              = "pending"
	balance1        int64        = 30
	consumed1       int64        = 6

	type2                        = "Personalleave"
	email2          strfmt.Email = "santosh@wanclouds.net"
	date3                        = "2019-06-12"
	t3, _                        = time.Parse(layoutISO, date3)
	datef3                       = strfmt.Date(t3)
	date4                        = "2019-06-21"
	t4, _                        = time.Parse(layoutISO, date4)
	datef4                       = strfmt.Date(t4)
	approvalstatus2              = "pending"
	balance2        int64        = 30
	consumed2       int64        = 6

	leave1 = &models.Leave{
		Type:           &type1,
		Email:          &email1,
		ID:             1,
		To:             &datef1,
		From:           &datef2,
		ApprovalStatus: approvalstatus1,
		Balance:        balance1,
		Consumed:       consumed1,
	}
	leave2 = &models.Leave{
		Type:           &type2,
		Email:          &email2,
		ID:             2,
		To:             &datef3,
		From:           &datef4,
		ApprovalStatus: approvalstatus2,
		Balance:        balance2,
		Consumed:       consumed2,
	}

	//profile2 = &models.Profile{
	//	DateOfJoin: &datef2,
	//	Email:      &email2,
	//	FirstName:  &first2,
	//	ID:         2,

	//}
)

var leaves = []*models.Leave{leave1, leave2}

var lastProfileid = 2

var itemsLock = &sync.Mutex{}

func (m *mgr) GetLeaves() ([]*models.Leave, error) {
	return leaves, nil
}

func (m *mgr) AddNewLeave(newLeaveToAdd *models.Leave) (int64, error) {
	itemsLock.Lock()
	defer itemsLock.Unlock()
	lastProfileid = lastProfileid + 1
	newLeaveToAdd.ID = int64(lastProfileid)
	leaves = append(leaves, newLeaveToAdd)
	return newLeaveToAdd.ID, nil

}

// update leave
func getleaveByID(id int64) (*models.Leave, int, error) {
	for idx, item := range leaves {
		if item.ID == id {
			return item, idx, nil
		}
	}
	return nil, 0, errors.NotFound("not found: item %d", id)
}

func (m *mgr) UpdateLeave(id int64, params *models.LeavePartial) (int64, error) {
	itemsLock.Lock()
	defer itemsLock.Unlock()
	leave, idx, err := getleaveByID(id)
	if err != nil {
		return 0, err
	}

	var paramsMap map[string]interface{}
	inrec1, _ := json.Marshal(params)
	json.Unmarshal(inrec1, &paramsMap)

	var leaveMap map[string]interface{}
	inrec2, _ := json.Marshal(leave)
	json.Unmarshal(inrec2, &leaveMap)

	// iterate through params
	for field, val := range paramsMap {
		if val != nil {
			leaveMap[field] = val
		}
	}

	var newLaave *models.Leave
	update, _ := json.Marshal(&leaveMap)
	json.Unmarshal(update, &newLaave)

	leaves[idx] = newLaave

	return id, nil
}

//Rmove leave by id
func (m *mgr) RemoveLeaveByID(id int64) (int64, error) {
	itemsLock.Lock()
	defer itemsLock.Unlock()

	if len(leaves) == 0 {
		return 0, errors.New(500, "Not found element")
	}

	var newLeaves []*models.Leave
	for _, prof := range leaves {
		if prof.ID != id {
			newLeaves = append(newLeaves, prof)
		}
	}

	if len(newLeaves) == len(leaves) {
		return 0, errors.New(500, "Not found element")
	}
	leaves = newLeaves

	return id, nil
}

//get leave by id
func (m *mgr) GetLeaveByID(id int64) (*models.Leave, error) {
	itemsLock.Lock()
	defer itemsLock.Unlock()
	leave, _, err := getleaveByID(id)
	if err != nil {
		return nil, err
	}

	return leave, nil
}
