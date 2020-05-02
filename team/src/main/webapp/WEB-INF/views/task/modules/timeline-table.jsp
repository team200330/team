<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="utf-8"%>

		    		
		    		<div class="card-body" style="padding:0px;">
						<c:choose>
							<c:when test="${not empty table}">
								<table id="timeline-table">${table}</table>	
							</c:when>
							<c:otherwise>
								업무없ㄷ음
							</c:otherwise>
						</c:choose>
						
					</div>