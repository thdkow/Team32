package com.team.marketd.service;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.transaction.annotation.Transactional;

import com.team.marketd.domain.MemberVo;

public interface MemberService {


	public int selectDoubleIdCheck(String id); // ���̵� �ߺ�Ȯ��
	
	public MemberVo login(String id,String pwd); //�α���
	
	public String checkAutoLogin();
	
	public String keepLogin();
	
	public MemberVo selectIdFind(String name,int birth,String question); //���̵�ã��
	
	public MemberVo selectPwdFind(String id,String name,String question); //��й�ȣã��
	
	public int updatePwd(String npwd,int midx); //��й�ȣ ����
	
	public MemberVo selectProfile(int midx); //ȸ������ ����
	
	public MemberVo checkPwd(int midx,String pwd); // ȸ������ �������� �̵��ϱ��� ��й�ȣ üũ
	
	public void updateProfile(int midx, String pwd,String phone, String email,int caidx,long account,String mkakao, String mquestion); //ȸ����������
	
	public void updateUpgrade(String mgrade,int midx); //������
	
	public void deleteProfile(int midx); //ȸ������
	
	public int insertProfile(String id, String pwd, String name, int birth, String sex, String mail, String phone,
			int caidx, long maccount, String kakao, String mqeustion,String ip); //ȸ������

	public void updateGB(int midx, int chidx, String rflag);

	public MemberVo checkGB1(int pidx);


}
