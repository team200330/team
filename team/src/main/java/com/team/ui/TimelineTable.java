package com.team.ui;

import java.util.Date;
import java.util.List;

import com.team.vo.Task;
import com.team.vo.TaskList;

import lombok.Data;

@Data
public class TimelineTable {
	private int startMonth = 4;
	private int endMonth = 7;
	private List<TaskList> taskLists;
	
	public TimelineTable() {}
	public TimelineTable(List<TaskList> taskLists) {
		this.taskLists = taskLists;
	}
	
	public String toString() {
		StringBuffer table = new StringBuffer();
		int[] endDate = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
		int listIdx = 0;
		int tdCnt = 1;
		
		for (int tr = 0; tr < 2 + taskLists.size(); tr++) {
			if (tr < 2) {
				table.append(tr == 0 ? "<tr id='month'><td width='250px'></td>" : "<tr id='date'><td></td>");
				
				for (int i = startMonth - 1; i < endMonth; i++) {
					if (tr == 0) // 첫번째행 달출력
						table.append("<td colspan='" + endDate[i] + "'>2020년 " + (i + 1) + " 월</td>");
					else 	 	 // 두번째행 일출력
					for (int j = 1; j < endDate[i] + 1; j++, tdCnt++) 
						table.append("<td>"+ j +"</td>");
				}
				
			}
			else { // 첫번째, 두번째행 아닐때 업무 출력
				table.append("<tr><td class='taskList' id='list-"+taskLists.get(listIdx).getListNo()+"'><i class='fas fa-chevron-down'></i>" + taskLists.get(listIdx).getListName() + "</td>");
				
				for (int i = startMonth - 1; i < endMonth; i++) { 
					for (int j = 1; j < endDate[i] + 1; j++) 
						if (j == 1) table.append("<td></td>");
						else table.append("<td></td>");
				}

				table.append("</tr>");
				
				for (Task t : taskLists.get(listIdx).getTasks()) {
					String tdClass = " task-" + t.getTaskNo() + " list-" + t.getListNo();
					String tContent = t.getContent().length() > 10 ? t.getContent().substring(0, 10) + " ..." : t.getContent();
					
					table.append("<tr class='task"+tdClass+"'><td>" + tContent + "</td>");
					
					for (int i = startMonth - 1; i < endMonth; i++) { 
						Date sDate = t.getStartDate();
						Date eDate = t.getEndDate();
						
						for (int j = 1; j < endDate[i] + 1; j++) {
							if (sDate != null && eDate != null) {

								if (sDate.getMonth() == i && sDate.getDate() == j) table.append("<td class='startdate"+tdClass+"'></td>");
								else if (eDate.getMonth() == i && eDate.getDate() == j) table.append("<td class='enddate'"+tdClass+"></td>");	
								else table.append("<td class='"+tdClass+"'></td>");
							}
							
							else table.append("<td class='"+tdClass+"'></td>");
						}
							
					}
					table.append("</tr>");
				}
			}
			
			if (tr < 2) table.append("</tr>");
			else listIdx++;
		}
		
		table.append("<tr><td colspan='"+ tdCnt +"'></td></tr>");
		
		return table.toString();
	}
	
}
