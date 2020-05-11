(function (factory, jQuery) {
  if (typeof define === 'function' && define.amd) {
    define('datepicker.ko', ['jquery'], factory);
  } else if (typeof exports === 'object') {
    factory(require('jquery'));
  } else {
    factory(jQuery);
  }
})(function ($) {
  $.fn.datepicker.lang['ko'] = {
    days: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
    daysMin: ['일', '월', '화', '수', '목', '금', '토'],
    months: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    monthsShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
    yearSuffix: '',
    monthSuffix: '',
    todaySuffix: '오늘',
    dateInputPlaceholder: '날짜 설정',
    rangeStartInputPlaceholder: '시작 일',
    rangeEndPlaceholder: '종료 일',
    dateTimeInputPlaceholder: '시간 설정',
    rangeStartTimeInputPlaceholder: '시작 시간',
    rangeEndTimeInputPlaceholder: '종료 시간',
    nowDateButton: '현재',
    confirmDateButton: '확인',
    cancelTimeButton: '취소',
    clearButton: '초기화'
  };
}, window.jQuery);
