from django.shortcuts import render
from django.http import HttpResponse
from .models import GetNess,GetSrc,UseShow,UseDp,UseLog,TransOut,TransIn,StoragePoint,StorageAllow,StorageEncryp,ServerLog,DeletePoint,PrivacyType,DpiaInfo,PrivacyInfo,DataTrans,UserCountry,Product
from django.db import connections
import random
import os
import hashlib
import json
from django.core import serializers
from .smtpemail import SmtpEmail

def investlist(request,ifall=None):
    data = {"flag_one": "invest", "flag_two": "investlist"}
    if ifall and ifall=='all':
        data['ifall']=1
    else:
        data['ifall'] = 0
    if ifall:
        dpialist=DpiaInfo.objects.all()
    else:
        dpialist=DpiaInfo.objects.all()#.filter(manager_email_list=request.session['useruid'])
    dlist=[]
    for dp in dpialist:
        dpdict={}
        dpdict['id']=dp.id
        dpdict['pro_desc'] = dp.pro_desc
        dpdict['pro_name'] = Product.objects.get(id=dp.pro_name).pro_name
        dpuc=dp.user_country.split(',')
        dpuclist=[]
        for d in dpuc:
            dpuclist.append(UserCountry.objects.get(id=d).desc_str)
        dpdict['user_country'] = ','.join(dpuclist)
        dpda = dp.data_country.split(',')
        dpdalist = []
        for d in dpda:
            dpdalist.append(UserCountry.objects.get(id=d).desc_str)
        dpdict['data_country'] = ','.join(dpdalist)
        dptr = dp.data_trans.split(',')
        dptrlist = []
        for d in dptr:
            dptrlist.append(DataTrans.objects.get(id=d).desc_str)
        dpdict['data_trans'] = ','.join(dptrlist)
        dpdict['pro_pri_leader'] = dp.pro_pri_leader
        dpdict['pro_pri_name'] = dp.pro_pri_name
        dpdict['add_time'] = dp.add_time
        dpdict['showid'] = dp.showid
        dlist.append(dpdict)

    data['dpialist']=dlist

    return render(request, 'invest/dpialist.html',data)


def getPriRefer():
    sql_str = '''
        select privacy_type.id,privacy_type.desc_str,privacy_type.col_name,
        get_ness.desc_str as get_ness,get_src.desc_str as get_src,use_show.desc_str as use_show,
        use_dp.desc_str as use_dp,use_log.desc_str as use_log,trans_out.desc_str as trans_out,
        trans_in.desc_str as trans_in,storage_point.desc_str as storage_point,storage_allow.desc_str as storage_allow,
        storage_encryp.desc_str as storage_encryp,server_log.desc_str as server_log,delete_point.desc_str as delete_point
        from privacy_type
        left join get_ness
        on privacy_type.get_ness = get_ness.id
        left join get_src
        on privacy_type.get_src = get_src.id
        left join use_show
        on privacy_type.use_show = use_show.id
        left join use_dp
        on privacy_type.use_dp = use_dp.id
        left join use_log
        on privacy_type.use_log = use_log.id
        left join trans_out
        on privacy_type.trans_out = trans_out.id
        left join trans_in
        on privacy_type.trans_in = trans_in.id
        left join storage_point
        on privacy_type.storage_point = storage_point.id
        left join storage_allow
        on privacy_type.storage_allow = storage_allow.id
        left join storage_encryp
        on privacy_type.storage_encryp = storage_encryp.id
        left join server_log
        on privacy_type.server_log = server_log.id
        left join delete_point
        on privacy_type.delete_point = delete_point.id

    '''

    #print(sql_str)
    cursor = connections['default'].cursor()
    cursor.execute(sql_str)
    pobjs = cursor.fetchall()
    cursor.close()
    ret_list = []
    for p in pobjs:
        data = {}
        data['id'] = p[0]
        data['desc_str'] = p[1]
        data['col_name'] = p[2]

        data['get_ness'] = p[3]
        data['get_src'] = filterNull(p[4])
        data['use_show'] = p[5]
        data['use_dp'] = filterNull(p[6])
        data['use_log'] = p[7]
        data['trans_in'] = p[9]
        data['trans_out'] = p[8]
        data['storage_allow'] = p[11]
        data['storage_encryp'] = p[12]
        data['delete_point'] = p[14]
        data['storage_point'] = p[10]
        data['server_log'] = p[13]
        ret_list.append(data)
    return ret_list
def getPriDatas():
    get_ness_dict=GetNess.objects.all()
    get_src_dict = GetSrc.objects.all()
    use_show_dict = UseShow.objects.all()
    use_dp_dict = UseDp.objects.all()
    use_log_dict = UseLog.objects.all()
    trans_out_dict = TransOut.objects.all()
    trans_in_dict = TransIn.objects.all()
    storage_point_dict = StoragePoint.objects.all()
    storage_allow_dict = StorageAllow.objects.all()
    storage_encryp_dict = StorageEncryp.objects.all()
    server_log_dict = ServerLog.objects.all()
    delete_point_dict = DeletePoint.objects.all()
    data={}

    data["get_ness_dict"] = get_ness_dict
    data["get_src_dict"] = get_src_dict
    data["use_show_dict"] = use_show_dict
    data["use_dp_dict"] = use_dp_dict
    data["use_log_dict"] = use_log_dict
    data["trans_out_dict"] = trans_out_dict
    data["trans_in_dict"] = trans_in_dict
    data["storage_point_dict"] = storage_point_dict
    data["storage_allow_dict"] = storage_allow_dict
    data["storage_encryp_dict"] = storage_encryp_dict
    data["server_log_dict"] = server_log_dict
    data["delete_point_dict"] = delete_point_dict
    return data
def filterNull(param):
    if param and param.strip():
        return param
    else:
        return ''


def getPriRefer():

    sql_str = '''
        select privacy_type.id,privacy_type.desc_str,privacy_type.col_name,
        get_ness.desc_str as get_ness,get_src.desc_str as get_src,use_show.desc_str as use_show,
        use_dp.desc_str as use_dp,use_log.desc_str as use_log,trans_out.desc_str as trans_out,
        trans_in.desc_str as trans_in,storage_point.desc_str as storage_point,storage_allow.desc_str as storage_allow,
        storage_encryp.desc_str as storage_encryp,server_log.desc_str as server_log,delete_point.desc_str as delete_point
        from privacy_type
        left join get_ness
        on privacy_type.get_ness = get_ness.id
        left join get_src
        on privacy_type.get_src = get_src.id
        left join use_show
        on privacy_type.use_show = use_show.id
        left join use_dp
        on privacy_type.use_dp = use_dp.id
        left join use_log
        on privacy_type.use_log = use_log.id
        left join trans_out
        on privacy_type.trans_out = trans_out.id
        left join trans_in
        on privacy_type.trans_in = trans_in.id
        left join storage_point
        on privacy_type.storage_point = storage_point.id
        left join storage_allow
        on privacy_type.storage_allow = storage_allow.id
        left join storage_encryp
        on privacy_type.storage_encryp = storage_encryp.id
        left join server_log
        on privacy_type.server_log = server_log.id
        left join delete_point
        on privacy_type.delete_point = delete_point.id
    
    '''

    #print(sql_str)
    cursor = connections['default'].cursor()
    cursor.execute(sql_str)
    pobjs = cursor.fetchall()
    cursor.close()
    ret_list=[]
    for p in pobjs:
        data = {}
        data['id']=p[0]
        data['desc_str']=p[1]
        data['col_name'] = p[2]

        data['get_ness'] = p[3]
        data['get_src'] = filterNull(p[4])
        data['use_show'] =p[5]
        data['use_dp'] = filterNull(p[6])
        data['use_log'] = p[7]
        data['trans_in'] = p[9]
        data['trans_out'] = p[8]
        data['storage_allow'] = p[11]
        data['storage_encryp'] = p[12]
        data['delete_point'] = p[14]
        data['storage_point'] = p[10]
        data['server_log'] = p[13]
        ret_list.append(data)
    return ret_list
def add_invest(request):
    data={"flag_one":"invest","flag_two":"add_invest"}
    pri_datas_all = getPriDatas()
    data.update(pri_datas_all)
    pri_refer_list = getPriRefer()
    data['pri_refer_list']=pri_refer_list
    print(pri_refer_list)
    data['data_trans']=DataTrans.objects.all()
    data['products']=Product.objects.all() #filter(id__lt=5)
    #print(len(data['products']))
    data['user_countrys']=UserCountry.objects.all()
    return render(request, 'invest/addinvest.html',data)
def getPrivacyMap():
    data={}
    data['device_mobile'] = 1
    data['device_imei'] = 2
    data['device_apps'] = 3
    data['device_pkgs'] = 4
    data['net_id_api'] = 5
    data['position_gps'] = 6
    data['basis_email'] = 7
    data['net_id_account']=8
    data['net_id_password'] = 9
    data['basis_name'] = 10
    data['basis_mobilephone'] = 11
    data['basis_telephone'] = 12
    data['basis_address'] = 13
    data['personal_id'] = 14
    data['biology_finger'] = 15
    data['biology_portrait'] = 16
    data['device_security'] = 17

    return data

def getPrivacyInfoList(request):
    data={}
    data['get_ness']=request.POST.getlist('get_ness')
    data['get_src'] = request.POST.getlist('get_src')
    data['get_src_list'] = request.POST.getlist('get_src_list')
    data['use_show'] = request.POST.getlist('use_show')
    data['use_dp'] = request.POST.getlist('use_dp')
    data['use_log'] = request.POST.getlist('use_log')

    data['trans_out'] = request.POST.getlist('trans_out')
    data['trans_in'] = request.POST.getlist('trans_in')
    data['storage_point'] = request.POST.getlist('storage_point')
    data['storage_allow'] = request.POST.getlist('storage_allow')
    data['storage_encryp'] = request.POST.getlist('storage_encryp')
    data['server_log'] = request.POST.getlist('server_log')
    data['delete_point'] = request.POST.getlist('delete_point')
    data['privacy_infoc'] = request.POST.getlist('privacy_infoc')
    data['privacy_backinfo'] = request.POST.getlist('privacy_backinfo')
    return data

def getPostData(request):
    data={}
    recode=0
    msg=""
    if not request.POST.get('pro_name',''):
        msg="项目名称不能为空"
    if not msg and not request.POST.get('pro_desc',''):
        msg = "项目介绍不能为空"
    if not msg and not request.POST.get('user_country', ''):
        msg = "用户所在国家不能为空"
    if not msg and not request.POST.get('data_country', ''):
        msg = "数据保存位置不能为空"
    if not msg and not request.POST.get('data_trans', ''):
        msg = "数据跨境不能为空"
    if not msg and not request.POST.get('pro_pri_leader', ''):
        msg = "产品隐私负责人不能为空"
    if not msg and not request.POST.get('pro_pri_name', ''):
        msg = "产品隐私专员不能为空"

    if not msg and request.POST.get('checklist_api')=='1':
        if not request.POST.get('checklist_api_name',''):
            msg="第三方产品名称不能为空"

    if not msg:
        pmap = getPrivacyMap()

        dlist=request.POST.getlist('privacy_infoc')
        slist=request.POST.getlist('get_src_list')
        plist=request.POST.getlist('use_dp')
        print('1111111111111111111111111')
        for mkey,mvalue in pmap.items():
            if request.POST.get(mkey,''):
                if dlist[mvalue-1] and slist[mvalue-1] and plist[mvalue-1]:
                    pass
                else:
                    msg="产品个人数据影响度评估有未填写项请检查"
                    break
    if msg:
        recode=1
    data['recode']=recode
    data['msg']=msg
    return data

def save_invest(request):

    data = getPostData(request)
    recode = data['recode']
    retdata = {}
    retdata["code"] = recode
    if recode != 0:
        retdata["msg"]=data["msg"]
        return HttpResponse(json.dumps(retdata, ensure_ascii=False), content_type="application/json,charset=utf-8")
    dpia_obj=DpiaInfo()
    dpia_obj.manager_email_list = 'test'#request.session['useruid']
    sedata=save_update_dpia_data(dpia_obj, request)
    shows = dpia_obj.add_time.strftime("%Y%m%d%H%M%S") + str(random.randint(1, 9))
    dpia_obj.showid = shows
    dpia_obj.save()
    #se = SmtpEmail()
    #se.sendInvestEmail(proname=sedata['proname'], invest_upemail=request.session['useruid'], investid=sedata['id'])
    return HttpResponse(json.dumps(retdata, ensure_ascii=False), content_type="application/json,charset=utf-8")
def GetFileMd5(filename):
    if not os.path.isfile(filename):
        return ""
    myhash = hashlib.md5()
    f = open(filename,'rb')
    while True:
        b = f.read(8096)
        if not b :
            break
        myhash.update(b)
    f.close()
    return myhash.hexdigest()
def uploadleakfile(request):
    #LEAKPATH='/opt/file/leak/'
    LEAKPATH = r'D:\atesta\leak'

    leakfile = request.FILES.get('leakfile')
    leakname = leakfile.name
    leaksize = leakfile.size
    rp = str(random.randint(10, 10000))
    apath=os.path.join(LEAKPATH,rp,leakname)
    retdata = {}
    adir = os.path.dirname(apath)
    if not os.path.exists(adir):
        os.mkdir(adir)
    f = open(apath, 'wb')
    for line in leakfile.chunks():
        f.write(line)
    f.close()
    leakmd5 = GetFileMd5(apath)



    retdata["code"]=0
    retdata["data"]={"leak_file":apath,"leak_name":leakname,"leak_size":leaksize,"leak_md5":leakmd5}



    #print(retdata)
    return HttpResponse(json.dumps(retdata,ensure_ascii=False),content_type="application/json,charset=utf-8")


def getPriObjs(invest_id):
    data={}
    dpiaobj = DpiaInfo.objects.filter(showid=invest_id).first()
    #if dpiaobj.biology_other: data['biology_other'] = PrivacyInfo.objects.get(id=dpiaobj.biology_other)
    #if dpiaobj.biology_face: data['biology_face'] = PrivacyInfo.objects.get(id=dpiaobj.biology_face)
    #if dpiaobj.biology_voice: data['biology_voice'] = PrivacyInfo.objects.get(id=dpiaobj.biology_voice)
    #if dpiaobj.asset_password: data['asset_password'] = PrivacyInfo.objects.get(id=dpiaobj.asset_password)

    if dpiaobj.net_id_account: data['net_id_account'] = PrivacyInfo.objects.get(id=dpiaobj.net_id_account)
    if dpiaobj.net_id_api: data['net_id_api'] = PrivacyInfo.objects.get(id=dpiaobj.net_id_api)
    if dpiaobj.net_id_password: data['net_id_password'] = PrivacyInfo.objects.get(id=dpiaobj.net_id_password)
    if dpiaobj.basis_name: data['basis_name'] = PrivacyInfo.objects.get(id=dpiaobj.basis_name)
    if dpiaobj.basis_mobilephone: data['basis_mobilephone'] = PrivacyInfo.objects.get(id=dpiaobj.basis_mobilephone)
    if dpiaobj.basis_telephone: data['basis_telephone'] = PrivacyInfo.objects.get(id=dpiaobj.basis_telephone)
    if dpiaobj.basis_address: data['basis_address'] = PrivacyInfo.objects.get(id=dpiaobj.basis_address)
    if dpiaobj.basis_email: data['basis_email'] = PrivacyInfo.objects.get(id=dpiaobj.basis_email)
    if dpiaobj.position_gps: data['position_gps'] = PrivacyInfo.objects.get(id=dpiaobj.position_gps)
    if dpiaobj.personal_id: data['personal_id'] = PrivacyInfo.objects.get(id=dpiaobj.personal_id)
    if dpiaobj.biology_finger: data['biology_finger'] = PrivacyInfo.objects.get(id=dpiaobj.biology_finger)
    if dpiaobj.biology_portrait: data['biology_portrait'] = PrivacyInfo.objects.get(id=dpiaobj.biology_portrait)
    if dpiaobj.device_mobile: data['device_mobile'] = PrivacyInfo.objects.get(id=dpiaobj.device_mobile)
    if dpiaobj.device_imei: data['device_imei'] = PrivacyInfo.objects.get(id=dpiaobj.device_imei)
    if dpiaobj.device_apps: data['device_apps'] = PrivacyInfo.objects.get(id=dpiaobj.device_apps)
    if dpiaobj.device_security: data['device_security'] = PrivacyInfo.objects.get(id=dpiaobj.device_security)
    if dpiaobj.device_pkgs: data['device_pkgs'] = PrivacyInfo.objects.get(id=dpiaobj.device_pkgs)
    #print(data['device_imei'])
    return data

def edit_invest(request,invest_id=None):
    data={"flag_one":"invest","flag_two":"add_invest"}
    pri_datas_all = getPriDatas()
    data.update(pri_datas_all)
    pri_refer_list = getPriRefer()
    data['pri_refer_list']=pri_refer_list
    data['data_trans'] = DataTrans.objects.all()
    data['products'] = Product.objects.all()
    data['user_countrys'] = UserCountry.objects.all()

    if invest_id:
        data['edit_add'] = 'edit'
        #dpiaobj = DpiaInfo.objects.get(id=invest_id)
        dpiaobj = DpiaInfo.objects.filter(showid=invest_id).first()
        data['d']=dpiaobj
        pri_objs=getPriObjs(invest_id)
        data.update(pri_objs)

    return render(request, 'invest/addinvest.html',data)

def update_invest(request):

    data = getPostData(request)
    recode = data['recode']
    retdata = {}
    retdata["code"] = recode
    if recode != 0:
        retdata["msg"] = data["msg"]
        return HttpResponse(json.dumps(retdata, ensure_ascii=False), content_type="application/json,charset=utf-8")
    try:
        edit_id = int(request.POST.get('edit_id'))
    except Exception as e:
        retdata["code"] = 1
        retdata["msg"] = "失效的ID"
        return HttpResponse(json.dumps(retdata, ensure_ascii=False), content_type="application/json,charset=utf-8")
    dpia_obj = DpiaInfo.objects.get(id=edit_id)
    PrivacyInfo.objects.filter(dpia_id=dpia_obj.id).delete()
    sedata=save_update_dpia_data(dpia_obj, request)
    #se = SmtpEmail()
    #se.sendInvestEmail(proname=sedata['proname'], invest_upemail=request.session['useruid'], investid=sedata['id'])
    return HttpResponse(json.dumps(retdata, ensure_ascii=False), content_type="application/json,charset=utf-8")

def save_update_dpia_data(dpia_obj,request):
    privacy_map = getPrivacyMap()
    privacy_info_list = getPrivacyInfoList(request)

    dpia_obj.pro_name = request.POST.get('pro_name')
    dpia_obj.pro_desc = request.POST.get('pro_desc')
    dpia_obj.user_country = request.POST.get('user_country_list')
    dpia_obj.data_country = request.POST.get('data_country_list')
    dpia_obj.pro_pri_leader = request.POST.get('pro_pri_leader')
    dpia_obj.pro_pri_name = request.POST.get('pro_pri_name')
    dpia_obj.data_trans = request.POST.get('data_trans_list')
    dpia_obj.checklist_dpia_check = request.POST.get('checklist_dpia_check')
    dpia_obj.checklist_datatrans = request.POST.get('checklist_datatrans')
    dpia_obj.checklist_db_manage = request.POST.get('checklist_db_manage')
    dpia_obj.checklist_user_allow = request.POST.get('checklist_user_allow')
    dpia_obj.checklist_privacy_policy = request.POST.get('checklist_privacy_policy')
    dpia_obj.checklist_feedback = request.POST.get('checklist_feedback')
    apiflag = request.POST.get('checklist_api')
    dpia_obj.checklist_api = apiflag
    if apiflag == '1':
        dpia_obj.checklist_api_name = request.POST.get('checklist_api_name')
    else:
        dpia_obj.checklist_api_name = ""
    dpia_obj.checklist_backinfo = request.POST.get('checklist_backinfo')
    if request.POST.get('biology_face', ''):
        dpia_obj.biology_face = 1
    else:
        dpia_obj.biology_face = 0
    if request.POST.get('biology_voice', ''):
        dpia_obj.biology_voice = 1
    else:
        dpia_obj.biology_voice = 0
    if request.POST.get('biology_other', ''):
        dpia_obj.biology_other = 1
    else:
        dpia_obj.biology_other = 0
    if request.POST.get('asset_password', ''):
        dpia_obj.asset_password = 1
    else:
        dpia_obj.asset_password = 0

    if request.POST.get('deal_nation', ''):
        dpia_obj.deal_nation = 1
    else:
        dpia_obj.deal_nation = 0
    if request.POST.get('deal_politic', ''):
        dpia_obj.deal_politic = 1
    else:
        dpia_obj.deal_politic = 0
    if request.POST.get('deal_religion', ''):
        dpia_obj.deal_religion = 1
    else:
        dpia_obj.deal_religion = 0
    if request.POST.get('deal_member', ''):
        dpia_obj.deal_member = 1
    else:
        dpia_obj.deal_member = 0
    if request.POST.get('deal_biology', ''):
        dpia_obj.deal_biology = 1
    else:
        dpia_obj.deal_biology = 0
    if request.POST.get('deal_health', ''):
        dpia_obj.deal_health = 1
    else:
        dpia_obj.deal_health = 0
    if request.POST.get('deal_sex', ''):
        dpia_obj.deal_sex = 1
    else:
        dpia_obj.deal_sex = 0

    dpia_obj.save()
    dpiaid = dpia_obj.id

    privacy_id_map = {}
    for tkey, tvalue in privacy_map.items():
        pmapid = 0
        p_type_id = tvalue - 1
        if request.POST.get(tkey, ''):
            pobj = PrivacyInfo()
            pobj.privacy_type_id = tvalue
            pobj.dpia_id = dpiaid
            pobj.get_ness = privacy_info_list['get_ness'][p_type_id]
            pobj.get_src = privacy_info_list['get_src_list'][p_type_id]

            pobj.use_show = privacy_info_list['use_show'][p_type_id]
            pobj.use_dp = privacy_info_list['use_dp'][p_type_id]
            pobj.use_log = privacy_info_list['use_log'][p_type_id]
            pobj.trans_out = privacy_info_list['trans_out'][p_type_id]
            pobj.trans_in = privacy_info_list['trans_in'][p_type_id]
            pobj.storage_point = privacy_info_list['storage_point'][p_type_id]
            pobj.storage_allow = privacy_info_list['storage_allow'][p_type_id]
            pobj.storage_encryp = privacy_info_list['storage_encryp'][p_type_id]
            pobj.server_log = privacy_info_list['server_log'][p_type_id]
            pobj.delete_point = privacy_info_list['delete_point'][p_type_id]
            pobj.privacy_infoc = privacy_info_list['privacy_infoc'][p_type_id]


            pobj.privacy_backinfo = privacy_info_list['privacy_backinfo'][p_type_id]
            pobj.save()
            pmapid = pobj.id
        privacy_id_map[tkey] = pmapid

    dpia_obj.device_mobile = privacy_id_map['device_mobile']
    dpia_obj.device_imei = privacy_id_map['device_imei']
    dpia_obj.device_apps = privacy_id_map['device_apps']
    dpia_obj.device_pkgs = privacy_id_map['device_pkgs']
    dpia_obj.net_id_api = privacy_id_map['net_id_api']
    dpia_obj.position_gps = privacy_id_map['position_gps']
    dpia_obj.basis_email = privacy_id_map['basis_email']
    dpia_obj.net_id_account = privacy_id_map['net_id_account']
    dpia_obj.net_id_password = privacy_id_map['net_id_password']
    dpia_obj.basis_name = privacy_id_map['basis_name']
    dpia_obj.basis_mobilephone = privacy_id_map['basis_mobilephone']
    dpia_obj.basis_telephone = privacy_id_map['basis_telephone']
    dpia_obj.basis_address = privacy_id_map['basis_address']
    dpia_obj.personal_id = privacy_id_map['personal_id']
    dpia_obj.biology_finger = privacy_id_map['biology_finger']
    dpia_obj.biology_portrait = privacy_id_map['biology_portrait']
    dpia_obj.device_security = privacy_id_map['device_security']

    dpia_obj.save()

    redata={}
    pobj = Product.objects.get(id=dpia_obj.pro_name)
    pname=""
    if pobj:
        pname=pobj.pro_name
    redata['proname'] = pname
    redata['id']=dpia_obj.showid
    return redata


def saveproname(request):
    recode=0
    retdata={}
    addproname=request.POST.get('add_proname','')
    #print(addproname)
    if not addproname:
        recode=1
    else:
        plist = Product.objects.filter(pro_name=addproname)
        if plist:
            recode=2
        else:
            pt = Product()
            pt.pro_name=addproname
            pt.save()
            retdata['ptid']=pt.id
    retdata["code"]=recode
    #print(retdata)
    return HttpResponse(json.dumps(retdata,ensure_ascii=False),content_type="application/json,charset=utf-8")
def contact(request):
    data={}
    data["flag_one"]='contact'
    return render(request, 'invest/contact.html', data)