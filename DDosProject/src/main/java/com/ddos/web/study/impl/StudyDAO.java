package com.ddos.web.study.impl;

import java.sql.Connection;


import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;


public class StudyDAO {
	static Connection conn = null;
	static PreparedStatement pstmt;
	static ResultSet rs;
	Scanner sc = new Scanner(System.in);

	/*
	 * String
	 * tempsql="select to_char(study_date,'dd') day,study_time,study_subject " +
	 * "	from study where to_char(study_date,'mm')=11";
	 */

	public StudyDAO() {
		String user = "ddos";
		String pw = "ddos";
		String url = "jdbc:oracle:thin:@180.71.250.243:1521:xe";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, pw);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	
	
	//이전,현재,다음 달의 스터디리스트를 받아옴
	public String[] studyListCalender(int year,int month) {

		String sql = "select to_number(to_char(study_date,'dd')) as day,study_time,study_name,studyroom_num,study_num,recruit_end"
				+ " from study where to_number(to_char(study_date,'yyyy'))=? "
				+ "and to_number(to_char(study_date,'mm'))=?";

		String ary[] = new String[32];
		int day;
		for (int i = 1; i < 32; i++) {
			ary[i] = "";
		}
		if(month>12)
		{
			year+=1;
			month=1;
		}
		else if(month<1)
		{
			year-=1;
			month=12;
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, year);
			pstmt.setInt(2, month);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				day = rs.getInt("day");
				ary[day] = ary[day] + rs.getInt("study_time") +" "+rs.getString("study_name")+"("
							+rs.getString("studyroom_num")+"번방)"+","+rs.getInt("study_num")+","+rs.getString("recruit_end")+",\t";
				System.out.println(ary[day]);
			}
		} catch (Exception e) {

		}
		return ary;
	}
		
	//스터디예약시 해당하는 날짜에 어떤 스터디가 있는지
	public int[][] getDailyStudyList(int month,int day) {
		String sql="select study_time, studyroom_num from study "
				+ "where to_number(to_char(study_date,'mm'))=? "
				+ "and to_number(to_char(study_date,'dd'))=?";
		int ary[][] = new int[2][3]; 
		int time,room;
		for(int i=0;i<3;i++)
		{
			ary[0][i]=1;
			ary[1][i]=1;
		}
		
		if(month>12)
			month=1;
		else if(month<1)
			month=12;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, month);
			pstmt.setInt(2, day);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				time=rs.getInt("study_time");
				room=rs.getInt("studyroom_num");
				if(time==9)
				{
					if(room==1)
					{
						ary[0][0]=0;
					}
					else{
						ary[1][0]=0;
					}
				}
				else if(time==12)
				{
					if(room==1){
						ary[0][1]=0;
					}
					else{
						ary[1][1]=0;
					}
				}
				else{
					if(room==1)
					{
						ary[0][2]=0;
					}
					else{
						ary[1][2]=0;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return ary;
	}	
/*	
	public void studyList() {
		String sql = "select * from study where study_date=?";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				StudyBean sb = new StudyBean();
				sb.setStudyNumber(rs.getInt("study_num"));
				sb.setStudyName(rs.getString("study_name"));
				sb.setStudySubject(rs.getString("study_subject"));
				sb.setStudyTime(rs.getInt("study_time"));
				sb.setStudyDate(rs.getString("study_date"));
				sb.setRecruitEnd(rs.getString("recruit_person"));
				sb.setRecruitPerson(rs.getInt("recruit_person"));
				sb.setStatus(rs.getString("status"));
				sb.setStudyroomNumber(rs.getInt("studyroom_num"));
				sb.setMemberId(rs.getString("member_id"));
			}
		} catch (Exception e) {

		}
	}*/

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (pstmt != null)
				pstmt.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}