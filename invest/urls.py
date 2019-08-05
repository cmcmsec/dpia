"""test35 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path
from . import views

urlpatterns = [
    path('',views.investlist),
    path('index/', views.investlist),
    path('investlist/<str:ifall>/', views.investlist),
    path('add_invest/', views.add_invest),
    path('edit_invest/<str:invest_id>/', views.edit_invest),
    path('save_invest/', views.save_invest),
    path('update_invest/', views.update_invest),
    path('saveproname/', views.saveproname),


]
