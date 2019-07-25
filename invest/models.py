# -*- coding:utf8 -*-
from django.db import models
import datetime
import random

class DataQusetion(models.Model):
    col_name = models.CharField(max_length=255)
    desc_str = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'data_qusetion'


class DeletePoint(models.Model):
    desc_str = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'delete_point'


class DjangoMigrations(models.Model):
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DpiaInfo(models.Model):
    manager_email_list = models.CharField(max_length=255)
    pro_name = models.IntegerField(blank=True, null=True)
    pro_desc = models.CharField(max_length=255)
    user_country = models.CharField(max_length=255)
    data_country = models.CharField(max_length=255)
    pro_pri_leader = models.CharField(max_length=255, blank=True, null=True)
    pro_pri_name = models.CharField(max_length=255, blank=True, null=True)
    net_id_account = models.IntegerField(blank=True, null=True)
    net_id_api = models.IntegerField(blank=True, null=True)
    net_id_password = models.IntegerField(blank=True, null=True)
    asset_password = models.IntegerField(blank=True, null=True)
    basis_name = models.IntegerField(blank=True, null=True)
    basis_mobilephone = models.IntegerField(blank=True, null=True)
    basis_telephone = models.IntegerField(blank=True, null=True)
    basis_address = models.IntegerField(blank=True, null=True)
    basis_email = models.IntegerField(blank=True, null=True)
    position_gps = models.IntegerField(blank=True, null=True)
    personal_id = models.IntegerField(blank=True, null=True)
    biology_face = models.IntegerField(blank=True, null=True)
    biology_voice = models.IntegerField(blank=True, null=True)
    biology_finger = models.IntegerField(blank=True, null=True)
    biology_portrait = models.IntegerField(blank=True, null=True)
    biology_other = models.IntegerField(blank=True, null=True)
    device_mobile = models.IntegerField(blank=True, null=True)
    device_imei = models.IntegerField(blank=True, null=True)
    device_apps = models.IntegerField(blank=True, null=True)
    device_security = models.IntegerField(blank=True, null=True)
    device_pkgs = models.IntegerField(blank=True, null=True)

    checklist_dpia_check = models.IntegerField()

    checklist_db_manage = models.IntegerField()
    checklist_privacy_policy = models.IntegerField()
    checklist_user_allow = models.IntegerField()
    checklist_feedback = models.IntegerField()
    checklist_dataleak = models.IntegerField(blank=True, null=True)
    checklist_backinfo = models.CharField(max_length=511, blank=True, null=True)
    checklist_dataflow = models.CharField(max_length=511,blank=True, null=True)
    checklist_dataleak_path = models.CharField(max_length=255, blank=True, null=True)
    checklist_dataleak_name = models.CharField(max_length=255, blank=True, null=True)
    add_time = models.DateTimeField(auto_now=True)
    checklist_api = models.IntegerField()
    checklist_api_name = models.CharField(max_length=255, blank=True, null=True)
    data_trans = models.CharField(max_length=255)

    deal_nation = models.IntegerField(blank=True, null=True)
    deal_politic = models.IntegerField(blank=True, null=True)
    deal_religion = models.IntegerField(blank=True, null=True)
    deal_member = models.IntegerField(blank=True, null=True)
    deal_biology = models.IntegerField(blank=True, null=True)
    deal_health = models.IntegerField(blank=True, null=True)
    deal_sex = models.IntegerField(blank=True, null=True)

    showid = models.CharField(max_length=32,blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'dpia_info'
    def get_time(self):
        d = self.add_time
        return getBeforeTime(d)
    def get_user_country(self):
        d=self.user_country
        d_list = d.split(',')
        r_list=[]
        for s in d_list:
            r_list.append(int(s))
        return r_list
    def get_data_country(self):
        d=self.data_country
        d_list = d.split(',')
        r_list=[]
        for s in d_list:
            r_list.append(int(s))
        return r_list
    def get_data_trans(self):
        d=self.data_trans
        d_list = d.split(',')
        r_list=[]
        for s in d_list:
            r_list.append(int(s))
        return r_list
    def save_showid(self):
        shows = self.add_time.strftime("%Y%m%d%H%M%S")+str(random.randint(1,9))
        self.showid = shows


def getBeforeTime(d):
    chunks = (
        (60 * 60 * 24 * 365, u'年'),
        (60 * 60 * 24 * 30, u'月'),
        (60 * 60 * 24 * 7, u'周'),
        (60 * 60 * 24, u'天'),
        (60 * 60, u'小时'),
        (60, u'分钟'),
    )

    if not isinstance(d, datetime.datetime):
        d = datetime.datetime(d.year, d.month, d.day)
    now = datetime.datetime.now().replace(tzinfo=pytz.timezone('UTC'))
    delta = now - d
    # 忽略毫秒
    # before = delta.days * 24 * 60 * 60 + delta.seconds  # python2.7直接调用
    # delta.total_seconds()
    before = delta.total_seconds()
    # 刚刚过去的1分钟
    if before <= 60:
        return u'刚刚'
    for seconds, unit in chunks:
        count = before // seconds
        if count != 0:
            break
    return str(count) + str(unit) + u"前"# This is an auto-generated Django model module.
class GetNess(models.Model):
    desc_str = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'get_ness'


class GetSrc(models.Model):
    desc_str = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'get_src'


class HighRisk(models.Model):
    desc_str = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'high_risk'


class Manager(models.Model):
    id = models.IntegerField(primary_key=True)
    name = models.CharField(max_length=255)
    email = models.CharField(max_length=255)
    depart = models.CharField(max_length=255, blank=True, null=True)
    leader = models.CharField(max_length=255, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'manager'


class PrivacyInfo(models.Model):
    privacy_type_id = models.IntegerField()
    dpia_id = models.IntegerField(blank=True, null=True)
    privacy_backinfo = models.CharField(max_length=511, blank=True, null=True)
    get_ness = models.IntegerField()
    get_src = models.CharField(max_length=63)
    use_show = models.IntegerField()
    use_dp = models.IntegerField()
    use_log = models.IntegerField()
    trans_out = models.IntegerField()
    trans_in = models.IntegerField()
    storage_point = models.IntegerField()
    storage_allow = models.IntegerField()
    storage_encryp = models.IntegerField()
    server_log = models.IntegerField()
    delete_point = models.IntegerField()
    privacy_infoc = models.CharField(max_length=511)

    class Meta:
        managed = False
        db_table = 'privacy_info'
    def get_privacy_backinfo(self):
        return self.privacy_backinfo.replace('\r\n','\\n').replace('\n','\\n')
    def get_privacy_infoc(self):
        return self.privacy_infoc.replace('\r\n','\\n').replace('\n','\\n')



class PrivacyType(models.Model):
    desc_str = models.CharField(max_length=255)
    col_name = models.CharField(max_length=255)
    get_ness = models.IntegerField()
    get_src = models.IntegerField()
    use_show = models.IntegerField()
    use_dp = models.IntegerField()
    use_log = models.IntegerField()
    trans_in = models.IntegerField()
    trans_out = models.IntegerField()
    storage_allow = models.IntegerField()
    storage_encryp = models.IntegerField()
    delete_point = models.IntegerField()
    storage_point = models.IntegerField()
    server_log = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'privacy_type'


class ServerLog(models.Model):
    desc_str = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'server_log'


class StorageAllow(models.Model):
    desc_str = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'storage_allow'


class StorageEncryp(models.Model):
    desc_str = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'storage_encryp'


class StoragePoint(models.Model):
    desc_str = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'storage_point'


class TransIn(models.Model):
    desc_str = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'trans_in'


class TransOut(models.Model):
    desc_str = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'trans_out'


class UseDp(models.Model):
    id = models.IntegerField(primary_key=True)
    desc_str = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'use_dp'


class UseLog(models.Model):
    desc_str = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'use_log'


class UseShow(models.Model):
    desc_str = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'use_show'


class User(models.Model):
    id = models.IntegerField(primary_key=True)
    username = models.CharField(max_length=32, blank=True, null=True)
    email = models.CharField(max_length=32, blank=True, null=True)
    password = models.CharField(max_length=32, blank=True, null=True)
    nickname = models.CharField(max_length=32, blank=True, null=True)
    role = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'user'





class Product(models.Model):
    pro_name = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'product'

class UserCountry(models.Model):
    desc_str = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'user_country'

class DataTrans(models.Model):
    desc_str = models.CharField(max_length=255)

    class Meta:
        managed = False
        db_table = 'data_trans'

