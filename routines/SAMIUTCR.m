SAMIUTCR ;ven/lgc - UNIT TEST for SAMICTR ; 2/6/19 12:57pm
 ;;18.0;SAMI;;
 ;
 ;@license: see routine SAMIUL
 ;
 ; @section 0 primary development
 ;
 ; @routine-credits
 ; @primary-dev: Larry Carlson (lgc)
 ;  larry@fiscientific.com
 ; @primary-dev-org: Vista Expertise Network (ven)
 ;  http://vistaexpertise.net
 ; @copyright: 2012/2018, ven, all rights reserved
 ; @license: Apache 2.0
 ;  https://www.apache.org/licenses/LICENSE-2.0.html
 ;
 ; @last-updated: 10/31/18 5:51pm
 ; @application: SAMI
 ; @version: 18.0
 ; @patch-list: none yet
 ;
 ; @to-do
 ;
 ; @section 1 code
 ;
START i $T(^%ut)="" W !,"*** UNIT TEST NOT INSTALLED ***" Q
 d EN^%ut($T(+0),2)
 q
 ;
 ;
STARTUP n utsuccess
 n root s root=$$setroot^%wd("vapals-patients")
 k @root@("graph","XXX00001")
 n SAMIUPOO D PLUTARR^SAMIUTST(.SAMIUPOO,"all XXX00001 forms")
 m @root@("graph","XXX00001")=SAMIUPOO
 K SAMIUPOO D PLUTARR^SAMIUTST(.SAMIUPOO,"ceform-2019-01-24")
 m @root@("graph","XXX00001","ceform-2019-01-24")=SAMIUPOO
 K SAMIUPOO D PLUTARR^SAMIUTST(.SAMIUPOO,"ceform-2018-01-02")
 m @root@("graph","XXX00001","ceform-2018-01-02")=SAMIUPOO
 Q
 ;
SHUTDOWN ; ZEXCEPT: utsuccess
 K utsuccess
 Q
 ;
 ;
UTWSRPT ; @TEST - web service which returns an html cteval report
 ;WSREPORT(return,SAMIFLTR)
 ;use ceform-2018-10-21
 n root s root=$$setroot^%wd("vapals-patients")
 k SAMIFLTR
 s SAMIFLTR("studyid")="XXX00001"
 s SAMIFLTR("form")="ceform-2018-10-21"
 s utsuccess=1
 d WSREPORT^SAMICTR(.SAMIUPOO,.SAMIFLTR)
 ; compare SAMIUPOO with SAMIUPOO from a Pull
 d PLUTARR^SAMIUTST(.SAMIUARC,"UTWSRPT^SAMIUTCR")
 ; now compare
 n pnode,anode s pnode=$na(SAMIUPOO),anode=$na(SAMIUARC)
 f  s pnode=$q(@pnode),anode=$q(@anode) q:pnode=""  d
 . I '(@pnode=@anode) s utsuccess=0
 s:'(anode="") utsuccess=0
 d CHKEQ^%ut(utsuccess,1,"Testing web service returns html cteval FAILED!")
 ;
 ;use ceform-2018-12-03
 k SAMIFLTR
 s SAMIFLTR("studyid")="XXX00001"
 s SAMIFLTR("form")="ceform-2018-12-03"
 s utsuccess=1
 d WSREPORT^SAMICTR(.SAMIUPOO,.SAMIFLTR)
 ; compare SAMIUPOO with SAMIUPOO from a Pull
 d PLUTARR^SAMIUTST(.SAMIUARC,"UTWSRPT^SAMIUTCR XXX12-3")
 ; now compare
 n pnode,anode s pnode=$na(SAMIUPOO),anode=$na(SAMIUARC)
 f  s pnode=$q(@pnode),anode=$q(@anode) q:pnode=""  d
 . I '(@pnode=@anode) s utsuccess=0
 s:'(anode="") utsuccess=0
 d CHKEQ^%ut(utsuccess,1,"Testing web service returns html cteval FAILED!")
 ;
 ;use ceform-2019-01-23
 k SAMIFLTR
 s SAMIFLTR("studyid")="XXX00001"
 s SAMIFLTR("form")="ceform-2019-01-23"
 s ^%wd(17.040801,23,"graph","XXX00001","ceform-2019-01-23","cetex")="b"
 s utsuccess=1
 d WSREPORT^SAMICTR(.SAMIUPOO,.SAMIFLTR)
 ; compare SAMIUPOO with SAMIUPOO from a Pull
 d PLUTARR^SAMIUTST(.SAMIUARC,"UTWSRPT^SAMIUTCR XXX01-23")
 ; now compare
 n pnode,anode s pnode=$na(SAMIUPOO),anode=$na(SAMIUARC)
 f  s pnode=$q(@pnode),anode=$q(@anode) q:pnode=""  d
 . I '(@pnode=@anode) s utsuccess=0
 s:'(anode="") utsuccess=0
 d CHKEQ^%ut(utsuccess,1,"Testing web service returns html cteval FAILED!")
 ;
 ;use ceform-2019-01-24
 k SAMIFLTR
 s SAMIFLTR("studyid")="XXX00001"
 s SAMIFLTR("form")="ceform-2019-01-24"
 s utsuccess=1
 d WSREPORT^SAMICTR(.SAMIUPOO,.SAMIFLTR)
 ; compare SAMIUPOO with SAMIUPOO from a Pull
 d PLUTARR^SAMIUTST(.SAMIUARC,"UTWSRPT^SAMIUTCR XXX01-24")
 ; now compare
 n pnode,anode s pnode=$na(SAMIUPOO),anode=$na(SAMIUARC)
 f  s pnode=$q(@pnode),anode=$q(@anode) q:pnode=""  d
 . I '(@pnode=@anode) s utsuccess=0
 s:'(anode="") utsuccess=0
 d CHKEQ^%ut(utsuccess,1,"Testing web service returns html cteval FAILED!")
 ;
 ;use ceform-2018-01-02
 k SAMIFLTR
 s SAMIFLTR("studyid")="XXX00001"
 s SAMIFLTR("form")="ceform-2018-01-02"
 s utsuccess=1
 d WSREPORT^SAMICTR(.SAMIUPOO,.SAMIFLTR)
 ; compare SAMIUPOO with SAMIUPOO from a Pull
 d PLUTARR^SAMIUTST(.SAMIUARC,"UTWSRPT^SAMIUTCR XXX01-02")
 ; now compare
 n pnode,anode s pnode=$na(SAMIUPOO),anode=$na(SAMIUARC)
 f  s pnode=$q(@pnode),anode=$q(@anode) q:pnode=""  d
 . I '(@pnode=@anode) s utsuccess=0
 s:'(anode="") utsuccess=0
 d CHKEQ^%ut(utsuccess,1,"Testing web service returns html cteval FAILED!")
 ;
 ; Now lets try a special case
 n SAMIUPOO,SAMIUARC,pnode,anode
 d PLUTARR^SAMIUTST(.SAMIUPOO,"ce-sb-si forms XXX0005")
 k @root@("graph","XXX0005")
 m @root@("graph","XXX0005")=SAMIUPOO
 k SAMIFLTR
 s SAMIFLTR("studyid")="XXX0005"
 s SAMIFLTR("form")="ceform-2016-01-01"
 s utsuccess=1
 d WSREPORT^SAMICTR(.SAMIUARC,.SAMIFLTR)
 d PLUTARR^SAMIUTST(.SAMIUPOO,"UTLOADD^SAMIUTF2 XXX0005")
 ; now compare
 n pnode,anode s pnode=$na(SAMIUPOO),anode=$na(SAMIUARC)
 f  s pnode=$q(@pnode),anode=$q(@anode) q:pnode=""  d
 . I '(@pnode=@anode) s utsuccess=0
 s:'(anode="") utsuccess=0
 k @root@("graph","XXX0005")
 d CHKEQ^%ut(utsuccess,1,"Testing web service returns html cteval XXX0005 FAILED!")
 q
 ;
UTOUT ; @TEST - out line
 ;OUT(ln)
 n cnt,rtn,SAMIUPOO
 s cnt=1,rtn="SAMIUPOO",SAMIUPOO(1)="First line of test"
 n SAMIULN s SAMIULN="Second line test"
 s utsuccess=0
 d OUT^SAMICTR(SAMIULN)
 s utsuccess=($g(SAMIUPOO(2))="Second line test")
 d CHKEQ^%ut(utsuccess,1,"Testing out(ln) adds line to array FAILED!")
 q
 ;
UTHOUT ; @TEST - hout line
 ;HOUT(ln)
 n cnt,rtn,SAMIUPOO
 s cnt=1,rtn="SAMIUPOO",SAMIUPOO(1)="First line of test"
 n SAMIULN s SAMIULN="Second line test"
 s utsuccess=0
 d HOUT^SAMICTR(SAMIULN)
 s utsuccess=($g(SAMIUPOO(2))="<p><span class='sectionhead'>Second line test</span>")
 d CHKEQ^%ut(utsuccess,1,"Testing out(ln) adds line to array FAILED!")
 q
 ;
UTXVAL ; @TEST - extrinsic which returns the dictionary value defined by var
 ;XVAL(var,vals,dict,valdx)
 s utsuccess=0
 s SAMIUARC(1)="Testing xval"
 s utsuccess=($$XVAL^SAMICTR(1,"SAMIUARC")="Testing xval")
 d CHKEQ^%ut(utsuccess,1,"Testing xval(var,vals) FAILED!")
 q
 ;
UTXSUB ; @TEST - extrinsic which returns the dictionary value defined by var
 ;XSUB(var,vals,dict,valdx)
 n SAMIUVALS,SAMIUVAR,SAMIUPOO,SAMIUVALDX,SAMIUDICT,result
 s utsuccess=0
 s SAMIUVALS="SAMIUPOO"
 s SAMIUVAR="cteval-dict"
 s SAMIUPOO(1)="biopsy"
 s SAMIUVALDX=1
 s SAMIUDICT=$$setroot^%wd("cteval-dict")
 s result=$$XSUB^SAMICTR(SAMIUVAR,SAMIUVALS,SAMIUDICT,SAMIUVALDX)
 s utsuccess=(result="CT-guided biopsy")
 D CHKEQ^%ut(utsuccess,1,"Testing xsub(var,vals,dict,valdx) FAILED!")
 q
 ;
EOR ;End of routine SAMIUTCR
