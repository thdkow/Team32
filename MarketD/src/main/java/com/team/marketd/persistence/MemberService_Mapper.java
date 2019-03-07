package com.team.marketd.persistence;

import java.util.HashMap;

import com.team.marketd.domain.MemberVo;

public interface MemberService_Mapper {
	

	public int selectDoubleIdCheck(HashMap<String,Object>hm); //���̵� �ߺ�Ȯ��
	
	public int insertProfile(HashMap<String,Object>hm); //ȸ������
	
	public MemberVo login(HashMap<String,Object>hm); //�α���
	
	public String checkAutoLogin(); //�ڵ��α��� 
	
	public String keepLogin(); //�ڵ��α��� 
	
	public MemberVo selectIdFind(HashMap<String, Object>hm); //���̵�ã��
	
	public MemberVo selectPwdFind(HashMap<String,Object>hm); //��й�ȣ ã��
	
	public int updatePwd(HashMap<String,Object>hm); //��й�ȣ ����
	
	public MemberVo selectProfile(HashMap<String,Object>hm); //ȸ������ ����
	
	public MemberVo checkPwd(HashMap<String,Object>hm); //������ ��й�ȣ üũ
	
	public void updateProfile(HashMap<String,Object>hm); //ȸ������ ����
	
	public void updateUpgrade(HashMap<String,Object>hm); //��� ��޾�
	
	public void deleteProfile(HashMap<String,Object>hm); //ȸ��Ż��

	public MemberVo checkGB1(HashMap<String, Object>hm); //�ߺ� ��õ Ȯ��1
	
	public void insertGB(HashMap<String, Object>hm); // �ߺ�Ȯ�� ���̺� �߰�
	
	public void updateGB(HashMap<String, Object>hm); // ��� ��ó�� �����̵�

	public int checkGB2(int midx, int chidx);
	

	
}
