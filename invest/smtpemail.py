#!/usr/bin/python
# -*- coding: UTF-8 -*-

import smtplib
from email.mime.text import MIMEText
from email.header import Header
from dpia.settings import SMTP_HOST,SMTP_PORT,SMTP_SENDER,INVEST_RECEIVERS,INVEST_LINK

class SmtpEmail(object):
    def __init__(self):
        self.host = SMTP_HOST
        self.port = SMTP_PORT
        self.sender=SMTP_SENDER
        self.invest_receivers = self.uniqueEmail(INVEST_RECEIVERS)
        self.invest_link = INVEST_LINK
        self.smtpObj = self.getSmtp()

    def getSmtp(self):
        smtpObj = smtplib.SMTP(self.host,self.port)
        return smtpObj
    def getInvestMessage(self,proname="",investid="",ifedit=""):

        if ifedit:
            ms_str='<p>个人数据合规评估系统，有审查记录修改，请注意查看。</p><p>审查记录产品名称:'
            subject = '个人数据合规评估系统，审查记录修改'
        else:
            ms_str = '<p>个人数据合规评估系统，有新的审查记录，请注意查看。</p><p>审查记录产品名称:'
            subject = '个人数据合规评估系统，新审查记录提交'
        linkstr = self.invest_link+str(investid)+'/'
        ms_str += str(proname)+',ID:'+str(investid)+'</p><p><a href="'+linkstr+'">审查记录链接</a></p>'
        message = MIMEText(ms_str, 'html', 'utf-8')
        message['From'] = self.sender
        message['To'] = ";".join(self.invest_receivers)
        message['Subject'] = Header(subject, 'utf-8')
        return message
    def sendInvestEmail(self,proname="",investid="",invest_upemail="",ifedit=""):

        if invest_upemail:
            self.invest_receivers.append(invest_upemail)
        message = self.getInvestMessage(proname,investid,ifedit)
        print(self.invest_receivers)
        print(message)
        reces = self.uniqueEmail(self.invest_receivers)
        try:
            self.smtpObj.sendmail(self.sender, reces, message.as_string())
            print( "邮件发送成功")
        except smtplib.SMTPException as e:
            print(e)
            print("Error: 无法发送邮件")
        self.smtpObj.quit()

    def uniqueEmail(self,inputlist=[]):
        outputlist=[]
        for e in inputlist:
            if e in outputlist:
                pass
            else:
                outputlist.append(e)
        return outputlist


if __name__ == "__main__":
    se = SmtpEmail()
    se.sendInvestEmail()
