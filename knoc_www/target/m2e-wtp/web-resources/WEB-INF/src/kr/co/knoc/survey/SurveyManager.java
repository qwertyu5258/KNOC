package kr.co.knoc.survey;

import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import kr.co.knoc.jdbc.DBUtil;
import kr.co.knoc.util.EtcUtil;
import kr.co.knoc.util.StringUtil;

public class SurveyManager {
	public boolean insertSurvey(SurveyForm sf) {
		Connection con = null;
		boolean result = false;
		
		try {
			
			con = DBUtil.getConnection();
			con.setAutoCommit(false);
	    	
			sf.setStartDate(sf.getStartYear() 
					+ Integer.toString(StringUtil.toInt(sf.getStartMonth())+100).substring(1) 
					+ Integer.toString(StringUtil.toInt(sf.getStartDay())+100).substring(1));
			sf.setStartTime("000001");
			sf.setEndDate(sf.getEndYear() 
					+ Integer.toString(StringUtil.toInt(sf.getEndMonth())+100).substring(1) 
					+ Integer.toString(StringUtil.toInt(sf.getEndDay())+100).substring(1));
			sf.setEndTime("235959");
			sf.setTotalVote(0);
			
			int surveyNum = insertNeoSurvey(sf);
			
			int questionCount = sf.getQuestionCount();
			for(int i = 0 ; i < questionCount; i++){
				String question = (String)sf.getQuestion()[i];
				String exampleString = (String)sf.getExample()[i];
				String questionType = (String)sf.getQuestionType()[i];
				String maxSelection = (String)sf.getMaxSelection()[i];
				
				/* 질문 입력 */
				SurveyQuestionBean sqb = new SurveyQuestionBean();
				sqb.setSurveyNum(surveyNum);				
				sqb.setQuestionNum(i+1);
				sqb.setQuestion(question);
				sqb.setMaxSelection(StringUtil.toInt(maxSelection));
				sqb.setQuestionType(questionType);
				
				insertNeoSurveyQuestion(sqb);
				
				/* 보기 입력 */
				/* 주관식이 아닐 경우에 입력*/
				if("0".equals(sqb.getQuestionType())) {
					String[] examples = exampleString.split("\n");
					for(int k = 0, eIdx = 1; k < examples.length ; k++){
						String example = examples[k].trim();
						if(!"".equals(example)) {
							SurveyExampleBean seb = new SurveyExampleBean();
							seb.setSurveyNum(surveyNum);
							seb.setQuestionNum(sqb.getQuestionNum());
							seb.setExampleNum(eIdx++);
							seb.setExample(example);
							seb.setVote(0);
							insertNeoSurveyExample(seb);
						}
					}			
				}
			}
			
			result = true;
			con.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
		    try{
		        con.rollback();
		    }catch(Exception ex) {}
		    return false;
		}
		finally {
			try {  con.setAutoCommit(true);	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
		return result;
	}
	
	public int insertNeoSurvey(SurveyForm sf) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		Statement stmt = null;
		String sql = null;
		int surveyNum = 0;
		
		try {
	    	con = DBUtil.getConnection();

	    	stmt = con.createStatement();
	    	
	    	sql = "select max(SURVEY_NUM) from NEOSURVEY";
	    	rs = stmt.executeQuery(sql);
	    	if (rs.next()) {
	    		System.out.println("rs.getInt(1)==>"+rs.getInt(1));
	    		surveyNum = rs.getInt(1) + 1;
	    	} else {
	    		surveyNum = 1;
	    	}
	    	rs.close();
	    	stmt.close();
	    	
			sql = "insert into NEOSURVEY (survey_num, title, purpose, start_date, start_time ";
			sql += ",end_date, end_time, creator, service_flag, max_vote, total_vote ";
			sql += ",create_date, duple_type, islogin)";
			sql += " values(?,?,?,?,?,?,?,?,?,?,?,SYSDATE,?,?)";
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++, surveyNum);			
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sf.getTitle(),"8859_1"));
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sf.getPurpose(),"8859_1"));
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sf.getStartDate(),"8859_1"));
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sf.getStartTime(),"8859_1"));
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sf.getEndDate(),"8859_1"));
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sf.getEndTime(),"8859_1"));
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sf.getCreator(),"8859_1"));
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sf.getServiceFlag(),"8859_1"));
			prestmt.setInt(index++, sf.getMaxVote());
			prestmt.setInt(index++, sf.getTotalVote());
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sf.getDupleType(),"8859_1"));
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sf.getIsLogin(),"8859_1"));
			
			prestmt.executeUpdate();	
			prestmt.close();				
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {				
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (stmt != null) stmt.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
			}
		}
		return surveyNum;
	}
	
	public void insertNeoSurveyQuestion(SurveyQuestionBean sqb) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		Statement stmt = null;
		String sql = null;
		
		try {
	    	con = DBUtil.getConnection();

	    	stmt = con.createStatement();
	    	
			sql = "insert into NEOSURVEY_QUESTION (survey_num, question_num ";
			sql += ",question,max_selection,question_type)";
			sql += " values(?,?,?,?,?)";
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++, sqb.getSurveyNum());			
			prestmt.setInt(index++, sqb.getQuestionNum());
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sqb.getQuestion(),"8859_1"));
			prestmt.setInt(index++, sqb.getMaxSelection());
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sqb.getQuestionType(),"8859_1"));			
			
			prestmt.executeUpdate();	
			prestmt.close();	
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {				
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (stmt != null) stmt.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
			}
		}
	}
	
	public void insertNeoSurveyExample(SurveyExampleBean seb) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		Statement stmt = null;
		String sql = null;
		
		try {
	    	con = DBUtil.getConnection();

	    	stmt = con.createStatement();
	    	
			sql = "insert into NEOSURVEY_EXAMPLE (survey_num, question_num ";
			sql += ",example_num,example,vote)";
			sql += " values(?,?,?,?,?)";
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++, seb.getSurveyNum());			
			prestmt.setInt(index++, seb.getQuestionNum());
			prestmt.setInt(index++, seb.getExampleNum());
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(seb.getExample(),"8859_1"));
			prestmt.setInt(index++, seb.getVote());			
			
			prestmt.executeUpdate();	
			prestmt.close();	
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {				
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (stmt != null) stmt.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
			}
		}
	}
	
	/**
	 * 설문 리스트
	 * @param key_gbn
	 * @param key_word
	 * @param page
	 * @param pageSize
	 * @return
	 */
	public ArrayList<SurveyBean> getNeoSurveyList(String schType, String schText, int page, int pageSize) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<SurveyBean> result = new ArrayList<SurveyBean>();
 		StringBuffer query = new StringBuffer();
 		String columns = "survey_num, start_date, end_date, title, create_date, total_vote, max_vote, service_flag , ROW_NUMBER() OVER(ORDER BY survey_num desc) AS PAGE_NO";
 		String orderby = "survey_num desc";
 		String where = "";
 		if (schType != null && !schType.equals("")) {
 			where = schType + " like '%" + schText + "%'";
 		}
 		query.append("select * from ( ");
        query.append("select " + columns);
        query.append(" from NEOSURVEY");
        if(!where.equals("")) query.append(" where " + where + "");
        if(!orderby.trim().equals("")) query.append(" order by " +orderby+ " " );
        //query.append("limit ?, ?");
        query.append(") a ");
        query.append(" WHERE  PAGE_NO > ?  AND PAGE_NO <= ? ");
        
		try {
			con = DBUtil.getConnection();
		
		    prestmt = con.prepareStatement(query.toString());
		    prestmt.setInt(1,(page-1) * pageSize);
		    prestmt.setInt(2,page*pageSize );
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				SurveyBean sb = new SurveyBean();
				sb.setSurveyNum(rs.getInt("survey_num"));
				sb.setStartDate(rs.getString("start_date"));
				sb.setEndDate(rs.getString("end_date"));
				sb.setTitle(rs.getString("title"));
				sb.setCreateDateString("yyyy-MM-dd hh:mm:ss", rs.getString("create_date"));
				sb.setTotalVote(rs.getInt("total_vote"));
				sb.setMaxVote(rs.getInt("max_vote"));
				sb.setServiceFlag(rs.getString("service_flag"));
				result.add(sb);
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return result;
    }
	
	/**
	 * 설문 리스트 카운트
	 * @param schType
	 * @param schText
	 * @return
	 */
	public int getNeoSurveyListCount(String schType, String schText) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		int result = 0;
 		StringBuffer query = new StringBuffer();
 		String where = "";
 		if (schType != null && !schType.equals("")) {
 			where = schType + " like '%" + schText + "%'";
 		}
        query.append("select count(*) ");
        query.append(" from NEOSURVEY");
        if(!where.equals("")) query.append(" where " + where + "");
		try {
			con = DBUtil.getConnection();
		
		    prestmt = con.prepareStatement(query.toString());
			rs = prestmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return result;
    }
	
	public SurveyView getSurveyView(int surveyNum) {
		SurveyView view = new SurveyView();
		SurveyBean survey = getSurvey(surveyNum);
		if (survey == null) return null;
		view.setSurvey(survey);
		List questionList = getSurveyQuestionList(surveyNum);
		
		List questionViewList = new ArrayList();
		Iterator i = questionList.iterator();
		while (i.hasNext()) {
			SurveyQuestionBean question = (SurveyQuestionBean)i.next();
			SurveyQuestionView questionView = new SurveyQuestionView(question);
			List exampleList = getSurveyExampleList(surveyNum, question.getQuestionNum());
			questionView.setExamples(exampleList);
			questionViewList.add(questionView);
		}
		view.setQuestions(questionViewList);
		return view;
	}
	
	public SurveyBean getSurvey(int surveyNum) {
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		SurveyBean sb = new SurveyBean();
 		
 		StringBuffer query = new StringBuffer();
        query.append("select ");
        query.append("SURVEY_NUM,TITLE,PURPOSE,START_DATE,START_TIME,END_DATE,");
        query.append("END_TIME,CREATOR,SERVICE_FLAG,MAX_VOTE,TOTAL_VOTE,CREATE_DATE,");
        query.append("DUPLE_TYPE,ISLOGIN ");
        query.append(" from NEOSURVEY");
        query.append(" where  SURVEY_NUM = ?");

        try {
			con = DBUtil.getConnection();
		
		    prestmt = con.prepareStatement(query.toString());
		    prestmt.setInt(1,surveyNum);
			rs = prestmt.executeQuery();
			
			if(rs.next()) {				
				sb.setSurveyNum(rs.getInt("survey_num"));
				sb.setTitle(rs.getString("title"));
				sb.setPurpose(rs.getString("purpose"));
				sb.setStartDate(rs.getString("start_date"));
				sb.setStartTime(rs.getString("start_time"));
				sb.setEndDate(rs.getString("end_date"));
				sb.setEndTime(rs.getString("end_time"));
				sb.setCreator(rs.getString("creator"));
				sb.setServiceFlag(rs.getString("service_flag"));
				sb.setMaxVote(rs.getInt("max_vote"));
				sb.setTotalVote(rs.getInt("total_vote"));
				sb.setCreateDateString("yyyy-MM-dd hh:mm:ss", rs.getString("create_date"));
				sb.setDupleType(rs.getString("duple_type"));
				sb.setIslogin(rs.getString("islogin"));
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
        } catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}		
		return sb;
	}	
	
	public List getSurveyQuestionList(int surveyNum) {
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		List questionList = new ArrayList();
 		
 		StringBuffer query = new StringBuffer();
        query.append("select ");
        query.append("SURVEY_NUM,QUESTION_NUM,QUESTION,MAX_SELECTION,QUESTION_TYPE");
        query.append(" from NEOSURVEY_QUESTION");
        query.append(" where  SURVEY_NUM = ? ORDER BY QUESTION_NUM ASC");

        try {
			con = DBUtil.getConnection();
		
		    prestmt = con.prepareStatement(query.toString());
		    prestmt.setInt(1,surveyNum);
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				SurveyQuestionBean sqb = new SurveyQuestionBean();
				sqb.setSurveyNum(rs.getInt("survey_num"));
				sqb.setQuestionNum(rs.getInt("question_num"));
				sqb.setQuestion(rs.getString("question"));
				sqb.setMaxSelection(rs.getInt("max_selection"));
				sqb.setQuestionType(rs.getString("question_type"));
				questionList.add(sqb);
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
        } catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}		
		return questionList;
	}
	
	public List getSurveyExampleList(int surveyNum, int questionNum) {
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		List exampleList = new ArrayList();
 		
 		StringBuffer query = new StringBuffer();
        query.append("select ");
        query.append("SURVEY_NUM, QUESTION_NUM,	EXAMPLE_NUM, EXAMPLE, VOTE");
        query.append(" from NEOSURVEY_EXAMPLE");
        query.append(" where  SURVEY_NUM = ? and QUESTION_NUM = ? ORDER BY EXAMPLE_NUM ASC");

        try {
			con = DBUtil.getConnection();
		
		    prestmt = con.prepareStatement(query.toString());
		    prestmt.setInt(1,surveyNum);
		    prestmt.setInt(2,questionNum);
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				SurveyExampleBean seb = new SurveyExampleBean();
				seb.setSurveyNum(rs.getInt("survey_num"));
				seb.setQuestionNum(rs.getInt("question_num"));
				seb.setExampleNum(rs.getInt("example_num"));
				seb.setExample(rs.getString("example"));
				seb.setVote(rs.getInt("vote"));
				exampleList.add(seb);
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
        } catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}		
		return exampleList;
	}
	
	public int updateSurvey(SurveyForm sf) {
		Connection con = null;
		int rs = 0;
		
		try {			
						
			con = DBUtil.getConnection();
			con.setAutoCommit(false);
	    			
			sf.setStartDate(sf.getStartYear() 
					+ Integer.toString(StringUtil.toInt(sf.getStartMonth())+100).substring(1) 
					+ Integer.toString(StringUtil.toInt(sf.getStartDay())+100).substring(1));
			sf.setStartTime("000001");
			sf.setEndDate(sf.getEndYear() 
					+ Integer.toString(StringUtil.toInt(sf.getEndMonth())+100).substring(1) 
					+ Integer.toString(StringUtil.toInt(sf.getEndDay())+100).substring(1));
			sf.setEndTime("235959");
			sf.setTotalVote(0);
			
			rs = updateNeoSurvey(sf);
			
			/* 질문 수정 (보기 수정 여부 체크 박스가 체크되었을 경우)  */
			if("Y".equals(sf.getInitEx())){
				int questionCount = sf.getQuestion().length;
				
				/* Merge Insert */
				int qIdx = 1;
				for(int i = 0 ; i < questionCount ; i++) {
					String question = (String)sf.getQuestion()[i];
					String exampleString = (String)sf.getExample()[i];
					String questionType = (String)sf.getQuestionType()[i];
					String maxSelection = (String)sf.getMaxSelection()[i];
					
					/* 질문 입력 */
					SurveyQuestionBean surveyQuestion = new SurveyQuestionBean();
					surveyQuestion.setSurveyNum(sf.getSurveyNum());
					surveyQuestion.setQuestionNum(qIdx++);
					surveyQuestion.setQuestion(question);
					surveyQuestion.setMaxSelection(StringUtil.toInt(maxSelection));
					surveyQuestion.setQuestionType(questionType);
					
					/* Merge Insert */					
					if(updateNeoSurveyQuestion(surveyQuestion) < 1) {						
						insertNeoSurveyQuestion(surveyQuestion);
					}
					
					/* 보기 입력 */
					/* 객관식일 경우에 입력*/
					if("0".equals(surveyQuestion.getQuestionType())) {
						String[] examples = exampleString.split("\n");
						int eIdx = 1;
						for(int k = 0 ; k < examples.length ; k++){
							String example = examples[k].trim();
							if(!"".equals(example)) {
								SurveyExampleBean surveyExample = new SurveyExampleBean();
								surveyExample.setSurveyNum(sf.getSurveyNum());
								surveyExample.setQuestionNum(surveyQuestion.getQuestionNum());
								surveyExample.setExampleNum(eIdx++);
								surveyExample.setExample(example);
								/* Merge Insert */
								if(updateNeoSurveyExample(surveyExample) < 1) {
									insertNeoSurveyExample(surveyExample);
								}
							}
						}
						
						/* 남은 보기 삭제 */
						// deleteSpareExample
						deleteSpareExample(sf.getSurveyNum()
								, surveyQuestion.getQuestionNum(), eIdx-1);
					}
					else {
						
						/* 보기 삭제 */
						// deleteExampleByQuestionNum
						deleteExampleByQuestionNum(sf.getSurveyNum()
								, surveyQuestion.getQuestionNum());
					}
				}
				/* 남은 질문 및 해당 질문 밑의 보기 삭제 */
				//deleteSpareQuestion
				deleteExampleBySpareQuestion(sf.getSurveyNum(), qIdx-1);
				deleteSpareQuestion(sf.getSurveyNum(), qIdx-1);
			}
			con.commit();
			rs = 1;
		}
		catch (Exception e) {
			e.printStackTrace();
		    try{
		        con.rollback();
		    }catch(Exception ex) {}
		}
		finally {
			try {  con.setAutoCommit(true);	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
		return rs;
	}
	
	public int updateNeoSurvey(SurveyForm sf) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		Statement stmt = null;
		String sql = null;
		int result = 0;
		
		try {
	    	con = DBUtil.getConnection();
	    	
			sql = "update NEOSURVEY set title=?, purpose=?, start_date=?, start_time=? ";
			sql += ",end_date=?, end_time=?, creator=?, service_flag=?, max_vote=? ";
			sql += ",duple_type=?, islogin=? where survey_num=?";
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);			
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sf.getTitle(),"8859_1"));
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sf.getPurpose(),"8859_1"));
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sf.getStartDate(),"8859_1"));
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sf.getStartTime(),"8859_1"));
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sf.getEndDate(),"8859_1"));
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sf.getEndTime(),"8859_1"));
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sf.getCreator(),"8859_1"));
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sf.getServiceFlag(),"8859_1"));
			prestmt.setInt(index++, sf.getMaxVote());
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sf.getDupleType(),"8859_1"));
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sf.getIsLogin(),"8859_1"));
			prestmt.setInt(index++, sf.getSurveyNum());			
			
			prestmt.executeUpdate();	
			prestmt.close();
			result = 1;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {				
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (stmt != null) stmt.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
			}
		}
		return result;
	}
	
	public int updateNeoSurveyQuestion(SurveyQuestionBean sqb) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		Statement stmt = null;
		String sql = null;
		int result = 0;
		
		try {
	    	con = DBUtil.getConnection();
	    	
			sql = "update NEOSURVEY_QUESTION set question=?, max_selection=? ";
			sql += ",question_type=? where survey_num=? and question_num=?";
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);			
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sqb.getQuestion(),"8859_1"));
			prestmt.setInt(index++, sqb.getMaxSelection());
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(sqb.getQuestionType(),"8859_1"));
			prestmt.setInt(index++, sqb.getSurveyNum());
			prestmt.setInt(index++, sqb.getQuestionNum());
			
			result = prestmt.executeUpdate();	
			prestmt.close();
			//result = 1;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {				
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (stmt != null) stmt.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
			}
		}
		return result;
	}
	
	public int updateNeoSurveyExample(SurveyExampleBean seb) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		Statement stmt = null;
		String sql = null;
		int result = 0;
		
		try {
	    	con = DBUtil.getConnection();
	    	
			sql = "update NEOSURVEY_EXAMPLE set example=? ";
			sql += "where survey_num=? and question_num=? and example_num=?";
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);			
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(seb.getExample(),"8859_1"));
			prestmt.setInt(index++, seb.getSurveyNum());
			prestmt.setInt(index++, seb.getQuestionNum());
			prestmt.setInt(index++, seb.getExampleNum());
			
			result = prestmt.executeUpdate();	
			prestmt.close();
			//result = 1;
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {				
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (stmt != null) stmt.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
			}
		}
		return result;
	}
	
	public void deleteSpareExample(int surveyNum, int questionNum, int exampleNum) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		Statement stmt = null;
		String sql = null;
		
		try {
	    	con = DBUtil.getConnection();
	    	
			sql = "delete from NEOSURVEY_EXAMPLE ";
			sql += "where survey_num=? and question_num=? and example_num > ?";
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);		
			prestmt.setInt(index++, surveyNum);
			prestmt.setInt(index++, questionNum);
			prestmt.setInt(index++, exampleNum);
			
			prestmt.executeUpdate();	
			prestmt.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {				
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (stmt != null) stmt.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
			}
		}
	}
	
	public int deleteExampleByQuestionNum(int surveyNum, int questionNum) {
		Connection con = null;
		PreparedStatement prestmt = null;
		Statement stmt = null;
		String sql = null;
		int result = 0;
		
		try {
	    	con = DBUtil.getConnection();
	    	
			sql = "delete from NEOSURVEY_EXAMPLE ";
			sql += "where survey_num=? and question_num=?";
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);		
			prestmt.setInt(index++, surveyNum);
			prestmt.setInt(index++, questionNum);
			
			result = prestmt.executeUpdate();	
			prestmt.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {				
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (stmt != null) stmt.close();
			} catch (Exception e) {
			}
		}
		return result;
	}
	
	public void deleteExampleBySpareQuestion(int surveyNum, int questionNum) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		Statement stmt = null;
		String sql = null;
		
		try {
	    	con = DBUtil.getConnection();
	    	
			sql = "delete from NEOSURVEY_EXAMPLE ";
			sql += "where survey_num=? and question_num > ?";
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);		
			prestmt.setInt(index++, surveyNum);
			prestmt.setInt(index++, questionNum);
			
			prestmt.executeUpdate();	
			prestmt.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {				
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (stmt != null) stmt.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
			}
		}
	}
	
	public void deleteSpareQuestion(int surveyNum, int questionNum) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		Statement stmt = null;
		String sql = null;
		
		try {
	    	con = DBUtil.getConnection();
	    	
			sql = "delete from NEOSURVEY_QUESTION ";
			sql += "where survey_num=? and question_num > ?";
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);		
			prestmt.setInt(index++, surveyNum);
			prestmt.setInt(index++, questionNum);
			
			prestmt.executeUpdate();	
			prestmt.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {				
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (stmt != null) stmt.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
			}
		}
	}
	
	public SurveyEntry getSurveyEntry(int surveyNum, String userid) {
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		SurveyEntry serveyEntry = new SurveyEntry();
 		
 		StringBuffer query = new StringBuffer();
        query.append("select ");
        query.append("SURVEY_NUM,ENTRY_NUM,ENTRY_ID,ENTRY_IP,ENTRY_DATE ");
        query.append(" from NEOSURVEY_ENTRY");
        query.append(" where  SURVEY_NUM = ? and ENTRY_ID = ?");

        try {
			con = DBUtil.getConnection();
		
		    prestmt = con.prepareStatement(query.toString());
		    prestmt.setInt(1,surveyNum);
		    prestmt.setString(2,userid);
			rs = prestmt.executeQuery();
			
			if(rs.next()) {	
				serveyEntry.setSurveyNum(rs.getInt("survey_num"));
				serveyEntry.setEntryNum(rs.getInt("entry_num"));
				serveyEntry.setEntryId(rs.getString("entry_id"));
				serveyEntry.setEntryIp(rs.getString("entry_ip"));
				serveyEntry.setEntryDate(rs.getString("entry_date"));			
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
        } catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}		
		return serveyEntry;
	}
	
	public boolean insertVoteSurvey(SurveyEntry entry, SurveyView surveyView, Map answerExamples) {
		Connection con = null;
		boolean result = false;
		
		try {
			
			con = DBUtil.getConnection();
			con.setAutoCommit(false);
	    	
			/* 참가자 입력 */
			int entryNum = getSurveyEntrySequence(entry.getSurveyNum());
			entry.setEntryNum(entryNum);
			insertSurveyEntry(entry);
			updateIncreaseTotalVote(entry.getSurveyNum());
			
			Iterator i = surveyView.getQuestions().iterator();
			while(i.hasNext()) {
				SurveyQuestionView questionView = (SurveyQuestionView)i.next();
				SurveyQuestionBean question = questionView.getQuestion();
				/* 개관식 또는 객관식 답 입력 */
				String[] ex = (String[])answerExamples.get(Integer.toString(question.getQuestionNum()));
				
				if("0".equals(question.getQuestionType())) {
					
					/* 객관식 */
					for(int k = 0 ; k < ex.length ; k++) {
						int exampleNum = StringUtil.toInt(ex[k]);
						/* 객관식 답변 로그 입력 */
						SurveyObjectiveAnswer answer = new SurveyObjectiveAnswer();
						answer.setSurveyNum(question.getSurveyNum());
						answer.setQuestionNum(question.getQuestionNum());
						answer.setEntryNum(entryNum);
						answer.setExampleNum(exampleNum);
						insertSurveyObjectiveAnswer(answer);
						
						/* 카운트 업데이트 */
						updateSurveyExampleVote(question.getSurveyNum(), question.getQuestionNum(), exampleNum);
					}
					
				} else {
					if(ex.length>0) {
						/* 주관식 */
						SurveySubjectiveAnswer answer = new SurveySubjectiveAnswer();
						answer.setSurveyNum(question.getSurveyNum());
						answer.setQuestionNum(question.getQuestionNum());
						answer.setAnswer(ex[0]);
						answer.setEntryNum(entryNum);
						
						insertSurveySubjectiveAnswer(answer);
					}
				}
			}
			
			result = true;
			con.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
		    try{
		        con.rollback();
		    }catch(Exception ex) {}
		    return false;
		}
		finally {
			try {  con.setAutoCommit(true);	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
		return result;
	}
	
	public int getSurveyEntrySequence(int survey_num) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		String sql = null;
		int entryNum = 0;
		
		try {
	    	con = DBUtil.getConnection();	    	
	    	
	    	sql = "SELECT MAX(ENTRY_NUM) FROM NEOSURVEY_ENTRY WHERE SURVEY_NUM = ?";
	    	prestmt = con.prepareStatement(sql);
	    	prestmt.setInt(1, survey_num);
	    	rs = prestmt.executeQuery();
	    	if (rs.next()) {
	    		entryNum = rs.getInt(1) + 1;
	    	} else {
	    		entryNum = 1;
	    	}
	    	rs.close();
	    	prestmt.close();	    		
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {				
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
			}
		}
		return entryNum;
	}
	
	public void insertSurveyEntry(SurveyEntry entry) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		String sql = null;
		
		try {
	    	con = DBUtil.getConnection();
	    	
			sql = "insert into NEOSURVEY_ENTRY (survey_num, entry_num, entry_id, entry_ip ";
			sql += ",entry_date)";
			sql += " values(?,?,?,?,sysdate)";
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++, entry.getSurveyNum());			
			prestmt.setInt(index++, entry.getEntryNum());
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(entry.getEntryId(),"8859_1"));
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(entry.getEntryIp(),"8859_1"));
			
			prestmt.executeUpdate();	
			prestmt.close();				
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {				
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
			}
		}
	}
	
	public void updateIncreaseTotalVote(int survey_num) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		String sql = null;
		
		try {
	    	con = DBUtil.getConnection();
	    	
			sql = "UPDATE NEOSURVEY SET TOTAL_VOTE = TOTAL_VOTE + 1 ";
			sql += "WHERE SURVEY_NUM = ?";
							
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1, survey_num);			
			
			prestmt.executeUpdate();	
			prestmt.close();				
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {				
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
			}
		}
	}
	
	public void insertSurveyObjectiveAnswer(SurveyObjectiveAnswer answer) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		String sql = null;
		
		try {
	    	con = DBUtil.getConnection();
	    	
			sql = "INSERT INTO NEOSURVEY_OBJECTIVE_ANSWER (survey_num, question_num ";
			sql += ",example_num, entry_num)";
			sql += " values(?,?,?,?)";
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++, answer.getSurveyNum());			
			prestmt.setInt(index++, answer.getQuestionNum());
			prestmt.setInt(index++, answer.getExampleNum());
			prestmt.setInt(index++, answer.getEntryNum());
			
			prestmt.executeUpdate();	
			prestmt.close();				
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {				
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
			}
		}
	}
	
	public void updateSurveyExampleVote(int survey_num, int question_num, int example_num) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		String sql = null;
		
		try {
	    	con = DBUtil.getConnection();
	    	
			sql = "UPDATE NEOSURVEY_EXAMPLE SET VOTE = VOTE + 1 ";
			sql += "WHERE SURVEY_NUM = ? AND QUESTION_NUM = ? AND EXAMPLE_NUM = ?";
							
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(1, survey_num);
			prestmt.setInt(2, question_num);
			prestmt.setInt(3, example_num);	
			
			prestmt.executeUpdate();	
			prestmt.close();				
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {				
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
			}
		}
	}
	
	public void insertSurveySubjectiveAnswer(SurveySubjectiveAnswer answer) {
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prestmt = null;
		String sql = null;
		
		try {
	    	con = DBUtil.getConnection();
	    	
			sql = "INSERT INTO NEOSURVEY_SUBJECTIVE_ANSWER (survey_num, question_num ";
			sql += ",entry_num,answer)";
			sql += " values(?,?,?,?)";
			
			int index = 1;					
			prestmt = con.prepareStatement(sql);
			prestmt.setInt(index++, answer.getSurveyNum());			
			prestmt.setInt(index++, answer.getQuestionNum());			
			prestmt.setInt(index++, answer.getEntryNum());
			prestmt.setString(index++, EtcUtil.strBlockSpecialTags(answer.getAnswer(),"8859_1"));
			
			prestmt.executeUpdate();	
			prestmt.close();				
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {				
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (rs != null) rs.close();
			} catch (Exception e) {
			}
		}
	}
	
	public int deleteNeoSurvey(int surveyNum) {
		int rs = 0;
		
		SurveyView survey = getSurveyView(surveyNum);

		List questionList = getSurveyQuestionList(surveyNum);
		
		Iterator i = questionList.iterator();
		while(i.hasNext()){
			SurveyQuestionBean question = (SurveyQuestionBean)i.next();
			/* 보기 삭제 */
			rs += deleteExampleByQuestionNum(surveyNum
					, question.getQuestionNum());
			/* 질문 삭제 */
			rs += deleteSurveyQuestion(surveyNum
					, question.getQuestionNum());
		}
		/* 설문 삭제 */
		rs += deleteSurvey(surveyNum);
			
		/* 참가자  삭제치 않음 */
		/* 객관식 답변 삭제 않음 */
		/* 주관식 답변 삭제 않음 */
		return rs;
	}
	
	public int deleteSurveyQuestion(int surveyNum, int questionNum) {
		Connection con = null;
		PreparedStatement prestmt = null;
		Statement stmt = null;
		String sql = null;
		int result = 0;
		
		try {
	    	con = DBUtil.getConnection();
	    	
			sql = "delete from NEOSURVEY_QUESTION ";
			sql += "where survey_num=? and question_num > ?";
							
			prestmt = con.prepareStatement(sql);		
			prestmt.setInt(1, surveyNum);
			prestmt.setInt(2, questionNum);
			
			result = prestmt.executeUpdate();	
			prestmt.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {				
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (stmt != null) stmt.close();
			} catch (Exception e) {
			}
		}		
		return result;
	}
	
	public int deleteSurvey(int surveyNum) {
		Connection con = null;
		PreparedStatement prestmt = null;
		Statement stmt = null;
		String sql = null;
		int result = 0;
		
		try {
	    	con = DBUtil.getConnection();
	    	
			sql = "delete from NEOSURVEY ";
			sql += "where survey_num=?";
						
			prestmt = con.prepareStatement(sql);		
			prestmt.setInt(1, surveyNum);
			
			result = prestmt.executeUpdate();	
			prestmt.close();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {				
				if (con != null) con.close();
				if (prestmt != null) prestmt.close();
				if (stmt != null) stmt.close();
			} catch (Exception e) {
			}
		}		
		return result;
	}	
	
	public SurveyQuestionBean getSurveyQuestion(int surveyNum, int questionNum) {
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		SurveyQuestionBean sqb = new SurveyQuestionBean();
 		
 		StringBuffer query = new StringBuffer();
        query.append("select ");
        query.append("SURVEY_NUM,QUESTION_NUM,QUESTION,MAX_SELECTION,QUESTION_TYPE");
        query.append(" from NEOSURVEY_QUESTION");
        query.append(" where  SURVEY_NUM = ? and QUESTION_NUM=?");

        try {
			con = DBUtil.getConnection();
		
		    prestmt = con.prepareStatement(query.toString());
		    prestmt.setInt(1,surveyNum);
		    prestmt.setInt(2,questionNum);
			rs = prestmt.executeQuery();
			
			if(rs.next()) {	
				sqb.setSurveyNum(rs.getInt("survey_num"));
				sqb.setQuestionNum(rs.getInt("question_num"));
				sqb.setQuestion(rs.getString("question"));
				sqb.setMaxSelection(rs.getInt("max_selection"));
				sqb.setQuestionType(rs.getString("question_type"));				
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
        } catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}		
		return sqb;
	}	
	
	public ArrayList<SurveySubjectiveAnswer> getSubjectiveAnswerList(String schText, int page, int pageSize, int surveyNum, int questionNum) {
		Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		ArrayList<SurveySubjectiveAnswer> result = new ArrayList<SurveySubjectiveAnswer>();
 		String where = "";
 		if (schText != null && !schText.equals("")) {
 			where = " and ANSWER like '%" + schText + "%' ";
 		} 		
 		StringBuffer query = new StringBuffer();
        query.append("select ");
        query.append("SURVEY_NUM, QUESTION_NUM,	ENTRY_NUM, ANSWER");
        query.append(" from NEOSURVEY_SUBJECTIVE_ANSWER");        
        query.append(" where SURVEY_NUM = ? and QUESTION_NUM = ?");
        query.append(where);
        query.append(" ORDER BY SURVEY_NUM DESC, QUESTION_NUM ASC, ENTRY_NUM ASC limit ?, ?");

        try {
			con = DBUtil.getConnection();
		
		    prestmt = con.prepareStatement(query.toString());
		    prestmt.setInt(1,surveyNum);
		    prestmt.setInt(2,questionNum);
		    prestmt.setInt(3,(page-1) * pageSize);
		    prestmt.setInt(4,page*pageSize);
			rs = prestmt.executeQuery();
			
			while(rs.next()) {
				SurveySubjectiveAnswer sqa = new SurveySubjectiveAnswer();
				sqa.setSurveyNum(rs.getInt("survey_num"));
				sqa.setQuestionNum(rs.getInt("question_num"));
				sqa.setEntryNum(rs.getInt("entry_num"));
				sqa.setAnswer(rs.getString("answer"));
				result.add(sqa);
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
        } catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}		
		return result;
	}
	
	public int getSubjectiveAnswerListCount(String schText, int surveyNum, int questionNum) {
    	Connection con = null;
 		ResultSet rs = null;
 		PreparedStatement prestmt = null;
 		int result = 0;
 		StringBuffer query = new StringBuffer();
 		String where = "";
 		if (schText != null && !schText.equals("")) {
 			where = " and ANSWER like '%" + schText + "%' ";
 		} 
        query.append("select count(*) ");
        query.append(" from NEOSURVEY_SUBJECTIVE_ANSWER");
        query.append(" where SURVEY_NUM = ? and QUESTION_NUM = ?");
        query.append(where);
		try {
			con = DBUtil.getConnection();
		
		    prestmt = con.prepareStatement(query.toString());
		    prestmt.setInt(1, surveyNum);
		    prestmt.setInt(2, questionNum);
			rs = prestmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
			rs.close(); rs = null;
			prestmt.close(); prestmt = null;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {  if (rs != null) rs.close();	} catch (Exception e) {}
			try {  if (prestmt != null) prestmt.close();	} catch (Exception e) {}
			try {  if (con != null) con.close();	} catch (Exception e) {}
		}
        return result;
    }
}
