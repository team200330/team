<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
            <div class="modal-header">
              <h4 class="modal-title">새 프로젝트</h4>
              <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <form id="writeform" role="form" action="write.action" method="post">
	            <div class="modal-body">
	                <div class="card-body">
	                  <div class="form-group">
	                    <label for="exampleInputEmail1">제목</label>
	                    <input id="projectName" name="projectName" class="form-control" type="text" placeholder="제목을 입력해주세요">
	                  </div>
	                  <div class="form-group">
	                    <label for="exampleInputPassword1">설명</label>
	                    <input id="content" name="content" class="form-control" type="text" placeholder="선택사항">
	                  </div>
                      <!-- radio -->
                      <div class="form-group">
                        <div class="custom-control custom-radio">
                          <input id="publicRadio1" name="public" value="비공개" class="custom-control-input" type="radio" checked>
                          <label for="publicRadio1" class="custom-control-label">비공개
                          <br><p style="font-weight: 400; font-size: 0.9rem;">추가된 멤버만 엑세스 가능</p>
                          </label>
                        </div>
                        <div class="custom-control custom-radio">
                          <input id="publicRadio2" name="public" value="공개"  class="custom-control-input" type="radio">
                          <label for="publicRadio2" class="custom-control-label">공개
                          <br><p style="font-weight: 400; font-size: 0.9rem;" >워크스페이스의 모든 멤버 엑세스 가능</p>
                          </label>
                        </div>
                      </div>
                      
                      <div>
                        <label for="exampleInputEmail1">프로젝트 멤버(선택사항)</label>
                      </div>
	                  
	                </div>
	                <!-- /.card-body -->
	            </div>
	            <div class="modal-footer justify-content-between">
	              <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	              <button type="button" class="btn btn-primary" id="saveSubmit">프로젝트 만들기</button>
	            </div>
            </form>

  		<button type="button" class="btn btn-block btn-outline-secondary btn-flat" data-toggle="modal" data-target="#modal-lg">
			<i class="fas fa-plus"></i> Add Project
		</button>    
      <div class="modal fade" id="modal-lg">
        <div class="modal-dialog modal-lg">
          <div class="modal-content">
            <jsp:include page="prwrite.jsp" />
          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->

            <form id="writeform" role="form" action="write.action" method="post">
	            <div class="modal-body">
	                <div class="card-body">
	                  <div class="form-group">
	                    <label for="exampleInputEmail1">제목</label>
	                    <input id="projectName" name="projectName" class="form-control" type="text" placeholder="제목을 입력해주세요">
	                  </div>
	                  <div class="form-group">
	                    <label for="exampleInputPassword1">설명</label>
	                    <input id="content" name="content" class="form-control" type="text" placeholder="선택사항">
	                  </div>
                      <!-- radio -->
                      <div class="form-group">
                        <div class="custom-control custom-radio">
                          <input id="publicRadio1" name="public" value="비공개" class="custom-control-input" type="radio" checked>
                          <label for="publicRadio1" class="custom-control-label">비공개
                          <br><p style="font-weight: 400; font-size: 0.9rem;">추가된 멤버만 엑세스 가능</p>
                          </label>
                        </div>
                        <div class="custom-control custom-radio">
                          <input id="publicRadio2" name="public" value="공개"  class="custom-control-input" type="radio">
                          <label for="publicRadio2" class="custom-control-label">공개
                          <br><p style="font-weight: 400; font-size: 0.9rem;" >워크스페이스의 모든 멤버 엑세스 가능</p>
                          </label>
                        </div>
                      </div>
                      
                      <div>
                        <label for="exampleInputEmail1">프로젝트 멤버(선택사항)</label>
                      </div>
	                  
	                </div>
	                <!-- /.card-body -->
	            </div>
	            <div class="modal-footer justify-content-between">
	              <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	              <button type="button" class="btn btn-primary" id="saveSubmit">프로젝트 만들기</button>
	            </div>
            </form>