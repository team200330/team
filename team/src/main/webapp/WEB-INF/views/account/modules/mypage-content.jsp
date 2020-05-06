<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>

			<!-- Main content -->
			<section class="content" style="height:100%">
				<!-- Default box -->
				<div class="card" style="margin: 30px 70px 10px 70px;">

					<!-- ./row -->

					<div class="card card-secondary card-tabs" style="margin-bottom: 0;background-color: #f5f5f5">
						<div class="card-header p-0 pt-1">
							<ul class="nav nav-tabs" id="custom-tabs-one-tab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="custom-tabs-one-home-tab" data-toggle="pill"
									href="#custom-tabs-one-home" role="tab"
									aria-controls="custom-tabs-one-home" aria-selected="true">내 프로필</a>
								</li>
								<li class="nav-item"><a class="nav-link"
									id="custom-tabs-one-profile-tab" data-toggle="pill"
									href="#custom-tabs-one-profile" role="tab"
									aria-controls="custom-tabs-one-profile" aria-selected="false">
										설정</a></li>
								

							</ul>
						</div>
						<div class="card-body">
						
							<!-- 내 프로필 -->
							<div class="tab-content" id="custom-tabs-one-tabContent">
								<div class="tab-pane fade show active" id="custom-tabs-one-home"
									role="tabpanel" aria-labelledby="custom-tabs-one-home-tab">

									<div class="card">
										<div class="card-body" style="padding:50px; display:flex">
											<div>
												<c:choose>
													<c:when test="${not empty loginuser.img}">
														<img id="profileImg" src="/team/resources/img/profile/${loginuser.img}" style="padding:2px;border:1px solid #adb5bd; width:120px; height:120px;">
												
													</c:when>
													<c:otherwise>
														<img id="profileImg" src="/team/resources/img/profile-default.jpg" style="padding:2px;border:1px solid #adb5bd; width:120px; height:120px;">
												
													</c:otherwise>
												</c:choose>
												<div id="img-update-btn">
													<i class="fas fa-camera"></i>
													사진 업데이트
												</div>
												<form id="img-form" action="/team/account/updateImg" method="post" enctype="multipart/form-data">
													<input type="file" name="img" id="img-select" style="display:none">
													<input type="hidden" name="email" value="${loginuser.email }">
												</form>
												
											</div>
											<div style="padding-left:50px;" class="profile-update">
												<form id="profile-form" method="post" action="/team/account/updateProfile" onSubmit="return false;">
													<div>
													<h6>이름</h6>
													<input type="text" name="name" value="${loginuser.name}"><br>
													<span class="check-text">팀원들이 본인을 알아볼 수 있도록 도와주세요.</span>
													</div>
													
													<div>
													<h6>부서</h6>
													<input type="text" name="department" value="${loginuser.department}"><br>
													<span class="check-text">부서명으로 본인을 찾을 수 있도록 도와주세요. 예) 디자인팀</span>
													</div>
													
													<div>
													<h6>직함</h6>
													<input type="text" name="position" value="${loginuser.position}"><br>
													<span class="check-text">자신이 무엇을 하는지 팀원들에게 알려주세요. 예) 웹디자이너</span>
													</div>
													
													<div>
													<h6>전화번호</h6>
													<input type="text" name="phone" value="${loginuser.phone}"><br>
													<span class="check-text">팀원들이 본인에게 연락할 수 있도록 도와주세요</span>
													</div>
													
													<div>
													<h6>주소</h6>
													<input readonly="readonly" type="text" id="roadAddress" name="roadnameAddr" placeholder="도로명주소">
													<button id="addr-btn" style="margin-left:3px; font-size: 10.5pt;border: 1px solid #d2d2d2;border-radius: .20rem;padding: 5 15 5 15;font-weight: bold;margin-left: 3px">우편번호 찾기</button><br>
													<input readonly="readonly" type="text" id="jibunAddress" placeholder="지번주소">
													<input type="text" id="detailAddress" name="detailAddr" placeholder="상세주소" style="margin-left:3px;margin-top:5px"><br>
													<span class="check-text">팀원들이 본인을 지도에서 찾을 수 있도록 도와주세요!</span>
													</div>
													
													<button class="submit-btn  disabled-submit-btn">변경사항 저장</button>
												</form>
											</div>
										</div>
										<!-- /.card-body -->
									</div>
									<!-- /.card -->
								
								</div>
								
								<!-- 설정 -->
								<div class="tab-pane fade" id="custom-tabs-one-profile"
									role="tabpanel" aria-labelledby="custom-tabs-one-profile-tab">

									<!-- Default box -->
									<div class="card">
										<div class="card-header">
											<h5 class="card-title">비밀번호 변경</h5>

											<div class="card-tools">
												<button type="button" class="btn btn-tool card-open-btn">
													<i class="fas fa-minus"></i>
												</button>
											</div>
										</div>
										<div class="card-body" style="display:none">
											<div class="password-update">
												<div>
												<h6>현재 비밀번호</h6>
												<input type="password" class="pw"> <a class="pw-show-btn">보이기</a><br>
												<span class="check-text"></span>
												</div>
												
												<div>
												<h6>새 비밀번호</h6>
												<input type="password" class="new-pw"> <a class="pw-show-btn">보이기</a><br>
												<span class="check-text"></span>
												</div>
												
												<div>
												<h6>새 비밀번호 확인</h6>
												<input type="password" class="pw-check"> <a class="pw-show-btn">보이기</a><br>
												<span class="check-text"></span>
												</div>

												<button class="submit-btn disabled-submit-btn" disabled="disabled">비밀번호 업데이트</button>
											</div>
										</div>
										<!-- /.card-body -->
									</div>
									<!-- /.card -->
								
								<!-- Default box -->
									<div class="card">
										<div class="card-header">
											<h5 class="card-title">계정 삭제</h5>

											<div class="card-tools">
												<button type="button" class="btn btn-tool card-open-btn">
													<i class="fas fa-minus"></i>
												</button>
											</div>
										</div>
										<div class="card-body" style="display:none">
											<div style="font-size:10.5pt; margin-bottom:15px;">
											한 번 삭제된 계정은 다시 복구할 수 없습니다. 계정이 삭제되면 현재 계정에서 생성된 모든 데이터에 더이상 엑세스할 수 없습니다. 
											삭제 후 Taskworld를 다시 이용하고자 한다면, 새로 가입해주셔야 합니다.
											</div>
											<button class="submit-btn" style="background-color:#e95e51; color:white !important; width: 170;">계정 삭제하기</button>
										</div>
										<!-- /.card-body -->
									</div>
									<!-- /.card -->

								</div>
								
							
							</div>
						</div>
						<!-- /.card -->
					</div>

				</div>



			</section>

	
