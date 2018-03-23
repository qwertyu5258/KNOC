<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
    <%
    	String aboutUs = (request.getServletPath().toString().indexOf("/sub01/") > -1 ? "sub01_5.jsp" : "sub02_2_1_5.jsp");
    	String OrganizationChart = (request.getServletPath().toString().indexOf("/sub01/") > -1 ? "sub01_5_1.jsp" : "sub02_2_1_5_1.jsp");
    %>

			<div class="organization">
				<h4><img src="/images/management/sub02_2_4_1_.gif" alt="조직"/></h4>
				<div class="organ">
					<ul class="tab">
						<li><a href="<%= aboutUs %>"><img src="/images/management/sub02_2_4_1_1.gif" alt="조직도"  id="premier_button1"/></a>
						</li>
						<li><a href="<%= OrganizationChart %>"><img src="/images/management/sub02_2_4_1_2r.gif" alt="각 부서 주요업무" id="premier_button2"/></a>
						</li>
						<!-- <li><a href="sub02_2_1_5_2.jsp" title="각 부서 연락처"><img src="/images/management/sub02_2_4_1_3.gif" alt="각 부서 연락처" id="premier_button3"/></a></li> -->
					</ul>
					<div class="pt30">
						<!--표-->
						<table summary="한국석유공사 각 부서별 주요업무 현황을 확인할 수 있습니다." class="chart1">
							<caption>
							한국석유공사 각 부서별 주요업무 현황
							</caption>
							<col width="150px" />
							<col width="500px" />
							<thead>
								<tr>
									<th scope="col" class="first">부서</th>
									<th scope="col">주요업무</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="first">비서팀</td>
									<td>
										<ul>
											<li>1. 비서 및 의전업무</li>
											<li>2. 사장 특명사항 수행</li>
										</ul>
									</td>
								</tr>								
								<tr>
									<td class="first">감사실</td>
									<td>
										<ul>
											<li>1. 감사 업무 </li>
											<li>2. 공직기강에 관한 사항</li>
											<li>3. 민원업무 총괄</li>
											<li>4. 감사위원회 운영</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="first">기획조정처</td>
									<td>
										<ul>
											<li>1. 이사회 및 임원추천위원회 운영</li>
											<li>2. 국회 및 대정부 관련 업무 총괄</li>
											<li>3. 경영 및 자체공시, 지속가능경영 및 정부 3.0 추진</li>
											<li>4. 홍보, 광고, 언론 관련 업무 </li>
											<li>5. 비전, 전략경영계획, 재무전략 수립 및 관리</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="first">예산처</td>
									<td>
										<ul>
											<li>1. 예산 관리</li>
											<li>2. 내부·정부 경영평가 제도개선 및 평가관리</li>
											<li>3. 상임이사 경영계약 체결 및 관리</li>
											<li>4. 사장경영계약 이행보고서 작성</li>
											<li>5. 원가·관리회계 업무</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="first">투자관리처</td>
									<td>
										<ul>
											<li>1. 투자기준 관리 및 경제적 필수 가정사항 관리 </li>
											<li>2. E&P자산 평가 기준 및 자산분류 기준 관리</li>
											<li>3. 포트폴리오 평가, 분석 및 계획 수립</li>
											<li>4. 기술감리 계획수립 및 시행</li>
											<li>5. 비축감리 계획수립 및 시행</li>
											<li>6. 자산 매각 기본계획 수립, 지원 및 협조</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="first">재무처</td>
									<td>
										<ul>
											<li>1. 국내외 자금조달 및 상환업무</li>
											<li>2. 회계, 세무, 관리회계 업무</li>
											<li>3. 리스크 관리</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="first">법무팀</td>
									<td>
										<ul>
											<li>1. 국내외 송무업무(중재 등 소송에 준하는 분쟁해결방법 포함)</li>
                                            <li>2. 사규관리</li>
                                            <li>3. 준법경영 추진 및 지적재산권 관리</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="first">총무관리처</td>
							  <td>
										<ul>
											<li>1. 기록물관리업무 </li>
                                             <li>2. 정보공개제도 관리, 운영 </li>
                                             <li>3. 자산관리 </li>
                                             <li>4. 사회공헌활동 및 중소기업 지원 </li>
                                             <li>5. 국내 및 국제조달 계약의 체결 및 업무지원 </li>
                                             <li>6. 손해보험 업무 </li>
                                             <li>7. 에특회계 관련 업무 </li>
                                             <li>8.  석유개발사업 대출심의회 운영 및 관리</li>
                                             <li>9.  사옥 시설물관리 및 본사 사택관리</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="first">인재경영처</td>
							  <td>
										<ul>
											<li>1. 인사 관리</li>
											<li>2. 교육훈련 계획 수립 및 실행</li>
											<li>3. 급여, 복리후생, 건강보험, 국민연금업무 </li>
										    <li>4. 노사관계 관리업무, 노무관련 법률 및 규정관리</li>
											</ul>
								  </td>
							  </tr>
								<tr>
									<td class="first">석유정보센터</td>
							  <td>
										<ul>
											<li>1. 장·단기 석유정보 조사계획 수립</li>
											<li>2. 석유정보 간행물 발간</li>
											<li>3. 에너지관련 국제기구(IEA, WPC, APEC 등)와의 협력업무</li>
											<li>4. 장·단기 유가전망</li>
											<li>5. 국내외 석유산업·시장 동향조사 및 분석</li>
											<li>6. Petronet 및 Opinet 운용 및 서비스 제공</li>
											</ul>
								  </td>
							  </tr>
								<tr>
									<td class="first">ICT추진처</td>
							  <td>
										<ul>
											<li>1. 정보통신망 관리·운영</li>
                                            <li>2. IT인프라 구축 및 운영</li>
                                            <li>3. 그룹웨어 등 업무시스템 구축 및 운영</li>
                                            <li>4. 사무용 S/W·전산장비도입 및 관리</li>
                                            <li>5. ERP 시스템 운영 및 관리</li>
                                            <li>6. Petronet 및 Opinet 관리 및 유지보수</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="first">안전환경처</td>
									<td>
										<ul>
											<li>1. 보건·안전·환경 정책 수립 및 운영체계 관리</li>
											<li>2. 재난안전 및 위기관리 총괄</li>
											<li>3. 현장 안전환경 지도·점검 및 모니터링, 성과분석 및 개선책 수립</li>
											<li>4. 보안제도 정책 수립 및 운영</li>
											<li>5. 개인정보보호 관리</li>
											<li>6. 비상대비업무에 관한 사항</li>
											<li>7. 을지연습업무 총괄</li>
											<li>8. 보안·방호·대테러업무</li>
											<li>9. 예비군·민방위대 자원관리 및 운영에 관한 업무</li>
									  </ul>
									</td>
							  </tr>
								<tr>
									<td class="first">E&amp;P총괄처</td>
							  <td>
										<ul>
											<li>1. E&P 사업 이력 및 현황관리 총괄, 대관업무 지원</li>
											<li>2. 단독운영, 공동운영, 비운영광구 회계심사</li>
											<li>3. 해외 출자회사 관리 총괄</li>
											<li>4. 신규자산 확보와 관련된 사업개발업무</li>
											<li>5. 신규사업 전략 수립, 타당성 평가</li>
											<li>6. 국제협력관련 MOU 체결·지원 및 후속조치 총괄</li>
											<li>7. NOC, IOC 및 국가간 협력관계 채널 구축 및 지원</li>
											<li>8. 석유개발 에특융자사업 감면 현황관리</li>
											<li>9. 시추선사업계획 및 관리</li>
										</ul>
									</td>
							  	</tr>
								<tr>
									<td class="first">중동/유럽사업처<br />
											북미사업처<br />
											남미/CIS사업처<br />
											아시아사업처</td>	
							  		<td>
										<ul>
											<li>1. 소관 사업 중장기 계획(탐사 및 생산) 수립</li>
											<li>2. 소관 사업 투자 및 운영효율성 관리(Capex, Opex 등)</li>
											<li>3. 소관 사업 계획 수립 및 관리</li>
											<li>4. 소관 사업 사업계획 수립 및 조정, 사업관리 </li>
											<li>5. 소관 사업 합작사 투자유치, 컨소시엄 운영 및 관리</li>
											<li>6. 소관 종료사업 사후관리(융자금 감면 등)</li>
											<li>7. 소관 자산 매각 세부추진계획 수립 및 실행</li>
										</ul>
								  </td>
								</tr>
								<tr>
									<td class="first">기술개발처</td>
									<td>
										<ul>
											<li>1. 석유개발기술 중장기 계획 수립</li>
											<li>2. 정부 연구개발과제 수행 및 관리</li>
											<li>3. E&P 기술자료 관리 및 정보 공유체계 구축·운영</li>
											<li>4. 에특회계 관련 기술검토 및 지원(성공불융자사업 기술평가)</li>
											<li>5. 정부의뢰 기술 지원(해외자원개발신고사업 등) </li>
											<li>6. 신성장 동력(디지털 오일필드 등) 기술의 발굴 및 개발</li>
											<li>7. 국내 가스하이드레이트, 비전통자원 사업관련 기술지원</li>
											<li>8. 셰일가스 개발기술 고도화</li>
											<li>9. 국제 연구 및 기술개발 협력</li>
										</ul></td>
								</tr>
								<tr>
									<td class="first">E&amp;P기술처</td>
									<td>
										<ul>
											<li>1. 탄성파탐사, 중·자력탐사 자료취득, 해석, 자료처리 및 영상화</li>
											<li> 2. 지하물성 추출(AVO, Attribute, Inversion)    </li>
 											<li>3. 광역지질, 석유시스템 및 탐사 플레이 분석</li>
 											<li>4. 유망구조 도출 및 평가 (자원량, GCOS 등)</li>
											<li> 5. 매장량 평가 및 관리</li>
 											<li>6. 생산자료 분석, 생산증진 방안</li>
											<li> 7. 저류층 시뮬레이션, 생산유전 저류층 지질 모델링 구축 </li>
 											<li>8. 유정완결 및 생산관내 유체유동 안정성 확보</li>
 											<li>9. 시추작업 기술지원 및 시추 후 평가 </li>
											<li>10. 개발단계 진입여부를 위한 사업성 평가 (기술부분)  </li>
											<li>11. 최종개발계획 (FDP) 수립</li>
											<li>12. 신규 광구 기술평가 (광구단위 정밀평가) </li>
											<li>13. 석유개발 기술자료 DB구축 지원 </li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="first">시추건설처</td>
									<td>
										<ul>
										  <li>1. 탐사성공사업 개발 및 생산계획 수립</li>
											<li> 2. 신규사업 개발관련 비용 검토 및 산정</li>
											<li> 3. 생산시설 관련 예산 편성 및 관리</li>
											<li> 4. 개발계획(생산시설 건설) 수립</li>
											<li> 5. 생산시설 건설공사 개발비용 산정, 평가, 유지보수 계약관련 업무 등</li>
											<li> 6. 석유개발사업 연계 SOC 건설공사 사업관리</li>
											<li> 7. 생산시설 공정 최적화, 개선, 증설관련 기술지원</li>
											<li> 8. 시추계획, 시추설계 및 작업 감독</li>
 											<li>9. 비운영사업, 신규사업 및 국책사업 시추 관련 기술지원</li>
											<li>10. 시추관련 HSEQ 관리 및 모니터링</li>
											<li>11. 석유개발 시추자료 수집 및 D/B 구축</li>
											<li>12. 유정완결 및 subsea기술지원</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="first">석유비축처</td>
									<td>
										<ul>
											<li>1. 장단기 석유류 비축계획 수립</li>
											<li>2. 비축기지 운영 총괄</li>
											<li>3. 비축기지 운영과 관련한 민원 및 보상업무 총괄</li>
											<li>4. 민간석유비축 관리 및 지도</li>
											<li>5. 비축유 품질 및 재고관리업무 총괄</li>
											<li>6. 비축기지 시설보수업무 총괄 </li>
											<li>7. 비축기지 지하수 및 수리지질 관련업무 총괄</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="first">석유사업처</td>
									<td>
										<ul>
										  <li>1. 비축유 구입계획 수립 및 계약 체결·관리</li>
                                            <li>2. 석유류 트레이딩 계획 수립 및 계약체결·관리</li>
                                            <li>3. 비축류 운영계획 수립 및 계약체결 관리</li>
                                            <li>4. 비상시 석유제품의 수급관리지원에 관한 사항</li>
                                            <li>5. 공동비축사업 계약 체결, 관리·운영</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="first">유통사업처</td>
									<td>
										<ul>
											<li>1. 알뜰주유소 사업계획 및 중장기 추진전략 수립</li>
                                            <li>2. 알뜰주유소 공급용 구매 및 계약체결</li>
                                            <li>3. 알뜰주유소 공급용 석유제품 수입관련 업무(통관, 세금납부 포함)</li>
                                            <li>4. 알뜰주유소에 대한 석유제품 판매(외상, 정산 포함) </li> 
                                            <li>5. 알뜰주유소 공급용 저장시설 임차 및 수송업무</li>
                                            <li>6. 알뜰주유소 통합정보시스템(E-COS) 관리</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="first">비축시설처</td>
									<td>
										<ul>
											 <li>1. 시설물의 신·증설 기본계획 수립</li>
											<li>2. 시설공사 설계관리</li>
											<li>3. 공사발주·안전·품질·환경관리</li>
											<li>4. 시설공사 지급자재 발주관리 및 하도급 관리</li>
											<li>5. 시설공사 하도급 관리</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="first">카자흐스탄사무소</td>
									<td>
										<ul>
											 <li>1. 주재국내 운영 및 비운영사업 현지관리</li>
											<li>2. 주재국 내 신규사업 발굴 및 지원</li>
											<li>3. 현지 자원협력</li>
											<li>4. 현지진출 석유회사 및 사업관련 정보·동향 조사</li>
											<li>5. 기타 주재국 및 인접국 공사관련 업무</li>
											<li>6. 주재국내 운영 및 비운영사업 안전·환경 관리</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="first">가스전관리사무소</td>
									<td>
										<ul>
											 <li>1. 육·해상, 해저 생산시설 관리·운영</li>
											<li>2. 생산시설 유지보수</li>
											<li>3. 안전환경사고 방지 및 사후처리</li>
										</ul>
									</td>
								</tr>
								<tr>
									<td class="first">
                                    	<ul>
                                        	<li>울산지사</li>
                                            <li>거제지사</li>
                                            <li>여수지사</li>
                                            <li>서산지사</li>
                                            <li>평택지사</li>
                                            <li>구리지사</li>
                                            <li>용인지사</li>
                                            <li>곡성지사</li>
											<li>동해지사</li>
                                        </ul>
                                    </td>
									<td>
										<ul>
										  <li>1. 비축유의 입출고, 저장관리, 품질관리(울산,거제,여수,서산)<br />
												&nbsp;&nbsp; &nbsp;비축석유·LPG의 입출고, 저장관리, 품질관리(평택,구리,용인,곡성,동해)</li> 
                                            <li>2. 비축시설 운영, 안전, 유지보수 관리</li>
                                           <li>3. 비축기지 운영관련 민원 및 보상업무</li>
                                                
										</ul>
									</td>
								</tr>								
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="new_officer">
			<table summary="담당부서 및 연락처 관리일">
				<caption>담당부서 및 연락처 관리일</caption>
				<tbody>
					<tr>
						<td class="write_day"><strong>작성기준일 : </strong>2017-01-02</td>
						<td class="contact_team"><strong>담당부서 : </strong>인재경영처	인사팀</td>
						<td class="contact_user"><strong>담당자 : </strong>차유회</td>
						<td class="contact_tel"><strong>연락처 : </strong>052-216-2114</td>
					</tr>
				</tbody>
				</table>
		</div>
