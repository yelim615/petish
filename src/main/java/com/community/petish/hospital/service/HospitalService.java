package com.community.petish.hospital.service;

import java.util.List;

import com.community.petish.hospital.domain.Criteria;
import com.community.petish.hospital.domain.HospitalVO;


public interface HospitalService {
	List<HospitalVO> gethospitalList(String hospital_addr);
	List<HospitalVO> getEmerhospitalList(String hospital_addr);
	List<HospitalVO> getListWithPaging(Criteria cri);
}
