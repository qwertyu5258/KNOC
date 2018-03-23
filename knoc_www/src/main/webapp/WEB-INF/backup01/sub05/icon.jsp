<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%><%@include file="/include/comheader.jsp"%>

	<%@include file="/include/subtopnavi.jsp"%><!--// subtopNavi: start //-->
	
	<div id="contents">
		<%@include file="/include/subleftmenu.jsp"%><!--// leftmenu: start //-->
		
		<div id="rightarea">
			<div id="subcnts">
				<h1><img src="/images/board/sub_title.jpg" alt="공사소개(About Us) 대한민국 경제를 움직이는 에너지,그 시작은 언제나 한국석유공사입니다" /></h1>
				<!--// location: start //-->
				<div class="locadv">
					<a href="/"><img src="/images/common/loca_home.gif" alt="한국석유공사 메인페이지로 이동" /></a>	
					&gt; <span>공사소개</span>
					&gt; <span>CEO소개</span>
					&gt; <span class="locanow">말씀자료</span>
				</div>
				<!--// location: end //-->
				
				<div class="pagetle">
					<h2 class="tleimg"><img src="/images/board/stle_1.gif" alt="말씀자료" /></h2>
				</div>
				
				<div id="boardsec">
					<table cellspacing="0" cellpadding="0" class="viewtype" summary="해당게시판은 말씀자료의 상세내용을 보여줍니다">
					<caption>해당게시판 상세보기</caption>
					<colgroup><col width="100px" /><col width="210px" /><col width="110px" /><col width="95px" /><col width="110px" /><col width="80px" /></colgroup>
						<tr>
							<th class="th1">제&nbsp;&nbsp;목</th>
							<td colspan="5" class="td1">2009년 신년사</td>
						</tr>
						<tr>
							<th class="th1">글쓴이</th>
							<td class="td1">경영정보실</td>
							<th class="th2">등록일</th>
							<td>2009-07-10</td>
							<th class="th2">조회수</th>
							<td>12345</td>
						</tr>
						<tr>
							<th class="th1">이메일</th>
							<td class="td1" colspan="5"><a href="mailto:">dsdsds@naver.com</a></td>
						</tr>
						<tr>
							<th class="th1">첨부파일</th>
							<td class="td1" colspan="5">
								<img src="/images/common/ico_hwp.gif" alt="한글첨부파일" /><a href="#">신년사.hwp</a> <span class="gab">;</span>
								<img src="/images/common/ico_hwp.gif" alt="한글첨부파일" /><a href="#">신년사_2.hwp</a>
							</td>
						</tr>
						<tr>
							<td colspan="6" class="cnts">
								친애하는 석유공사 임직원 여러분!<br/><br/>								
								창립 30주년을 맞이하는 희망찬 기축년(己丑年) 새해가 시작되었습니다.<br/>
								새해에도 임직원 여러분 가정에 즐거움과 행운이 가득하기를 바라며, 멀리 해외에서 근무하는 직원들에게도 건강과 축복이<br/> 
								함께 하기를 기원합니다.
							</td>
						</tr>
					</table>
					<!--// replebox: start //-->
					<div class="replesec">
						<ul class="replul">
							<li>
								<div class="rpname"><img src="/images/common/ico_arrow.gif" alt="" /> 홍길동 :</div>
								<div class="rptxt">덧글내용 표출 <a href="#"><img src="/images/board/btn_reple_del.gif" alt="삭제" /></a></div>
							</li>
							<li>
								<div class="rpname"><img src="/images/common/ico_arrow.gif" alt="" /> 홍길동2 :</div>
								<div class="rptxt">덧글내용 표출 <a href="#"><img src="/images/board/btn_reple_del.gif" alt="삭제" /></a></div>
							</li>
						</ul>
						
						<div class="replwrite">
							<p>
								<label for="replname">이름 :</label> <input type="text" value="" id="replname" class="input" style="width:80px;" />
							</p>
							<p>
								<label for="replpwd">비밀번호 :</label> <input type="text" value="" id="replpwd" class="input" style="width:80px;" />
							</p>
							<div class="reptxt">
								<div class="repdvleft">
									<label for="repltxt" class="nlabel">덧글입력</label>
									<textarea id="repltxt" ></textarea>
								</div>
								<div class="repdvright"><a href="#"><img src="/images/board/btn_reple_wt.gif" alt="덧글쓰기" /></a></div>
							</div>
						</div>
					</div>
					<!--// replebox: end //-->
					
					<div class="boardbtm mtm10">
						<!--// prev/next list: start //-->
						<table cellspacing="0" cellpadding="0" class="viewtype2" summary="해당게시판의 이전다음글을 보여줍니다">
						<caption>이전/다음글</caption>
						<colgroup><col width="95px" /><col width="605px" /></colgroup>
							<tr>
								<th><img src="/images/board/ico_prevtxt.gif" alt="" /> 이전글</th>
								<td>이전글이 없습니다</td>
							</tr>
							<tr>
								<th><img src="/images/board/ico_nexttxt.gif" alt="" /> 다음글</th>
								<td><a href="#">강영원 사장 취임사(2008.8.19)</a></td>
							</tr>
						</table>
						<!--// prev/next list: end //-->
						
						<div class="btnsec">
							<a href="write.jsp"><img src="/images/board/btn_inwrite.gif" alt="글쓰기" /></a>
							<a href="list.jsp"><img src="/images/board/btn_list.gif" alt="목록" /></a>
							<a href="#"><img src="/images/board/btn_answer.gif" alt="답글" /></a>
							<a href="#"><img src="/images/board/btn_modi.gif" alt="수정" /></a>
							<a href="#"><img src="/images/board/btn_del.gif" alt="삭제" /></a>
							<a href="#"><img src="/images/board/btn_move.gif" alt="이동" /></a>
							<a href="#"><img src="/images/board/btn_ok.gif" alt="확인" /></a>
							<a href="#"><img src="/images/board/btn_cancel.gif" alt="취소" /></a>
                            <a href="#"><img src="/images/board/btn_rss.gif" alt="RSS" /></a>
                            <a href="#"><img src="/images/board/btn_reset.gif" alt="복원" /></a>
                            <a href="#"><img src="/images/board/btn_rog.gif" alt="로그보기" /></a>
                            <a href="#"><img src="/images/board/ico_secret.gif" alt="비공개" /></a>
							<a href="#"><img src="/images/board/btn_cool.gif" alt="COOL" /></a>
                            <a href="#"><img src="/images/board/btn_no.gif" alt="공지" /></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%@include file="/include/comfooter.jsp"%><!--// footer: start //-->	<!--// footer: end //-->	
</div>
</body>
</html>