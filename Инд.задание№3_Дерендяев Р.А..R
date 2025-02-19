ds3<-DS_3_1
any(is.na(ds3)==TRUE)
ds3
ds3$�������_�������_�������<-as.factor(ifelse(ds3$�������_�������_�������==1,"��","���"))
ds3$�����_���������_������<-as.factor(ifelse(ds3$�����_���������_������==1,"��","���"))
str(ds3)

#��������� �������� ������ ����������� ������� ������ �� ���������� ����������, ������������������� ���������� ����������
library(ggplot2)
library(lessR)
library(dplyr)
ggplot(ds3, aes(x=�����������_������, y=�������))+geom_point()+stat_smooth(method="lm")
model_1<-lm(data=ds3, �������~�����������_������)
summary(model_1) 
#�����������, ��� ����������� ������ ���� ������� �� ������ ���������� 5%, ��� ��� �� ��������� �������� ������������� ���������
#��� ���������� ����������� ������ �� 1 �������� ������� ���������� �� 640,3 ��. 
#��� ������� ����������� ������ ������� ���������� 78006,8 ��.
#�� ������������ ����� 0,027
#F-�������� ������ ������������ ��������=3,90; ������ � ����� �������� ������������� �������� p=0.042<0.05


#��������� ��������������� ������ ����������� ������� ������ �� ������� ��������� ����, ������������������� ���������� ����������
#��������������� ������ ����������� - ������ ���� lnY=b0+b*lnX
ggplot(ds3, aes(x=log(S_���������_����), y=log(�������)))+geom_point()+stat_smooth(method="lm")
model_2<-lm(data=ds3, I(log(�������))~I(log(S_���������_����)))
summary(model_2)
#�� ��������� �������� ������������� ���������. � ����� ������ �������� ������������� �������� (p<0.05 � F-�������� > ������������)
#��� ���������� ������� ���� �� 1 ��. ������� ���������� � (s2/s1)^0.16 ��� 
#�� ������������ ����� 0,212


#��������� ������������ ������ ����������� ������� ������ �� ���������� ������������ ������, ������������������� ���������� ����������
#������������ ������ ����������� ��� ����������� Y=b0+b1*X+b2*X^2
ggplot(ds3, aes(x=(����������_������������_������)^2, y=�������))+geom_point()+stat_smooth(method="lm",formula = y~I(x^2))
model_3<-lm(data=ds3, �������~I(����������_������������_������^2)+����������_������������_������)
summary(model_3)
# � ����� ������ �������� ������������� ���������� (p>0.05 � F-�������� < ������������)
#�� ������������ ����� 0,07


#��������� �������� ������ ����������� ������� ������ �� ������� ��������� ����, ������� � ������ ������� �������-������� 
#� �������� ��������� ����������, ������������������� ���������� ����������
ggplot(ds3, aes(x=S_���������_����, y=�������))+geom_point()+xlab("������� ��������� ����") +stat_smooth(method="lm")
ggplot(ds3, aes(x=S_���������_����, y=�������, colour=�������_�������_�������))+geom_point()+xlab("������� ��������� ����") #+stat_smooth(method="lm")
ggplot(ds3, aes(x=S_���������_����, fill=�������_�������_�������))+geom_density(alpha=.3)+xlab("������� ��������� ����")
model_4<-lm(data=ds3, �������~S_���������_����+�������_�������_�������)
summary(model_4)
Regression(data=ds3, �������~S_���������_����+�������_�������_�������)
#�� ��������� �������� ������������� ��������. � ����� ������ �������� ������������� �������� (p<0.05 � F-�������� > ������������)
#�� ������������ ����� 0,69
#��� ���������� ������ ������� ������� ������� ������ �� 52653,8 ��.
#��� ���������� ������� �� 1��. ������� ������ �� 23,1��.


#��������� ������������ ������ ����������� ������� ������ �� ���������� ����������, ������� � ������ ���������� � ��������� 
#������ � �������� ��������� ����������, �������� �� ������������ ������, ������������������� ���������� ����������
#������������ ������ ����������� ��� ����������� Y=b0+b1*X+b2*X^2
names(ds3)
ggplot(ds3, aes(x=(�����������_������)^2, y=�������, color=�����_���������_������))+geom_point()+stat_smooth(method="lm",formula = y~I(x^2))
#����� ����, ��� �������, ��������������� ���������� ������ � ��������� ������ ����������� ����� ������� 
#���������� �������� ������ �� �������������� ���������: ������ ��� ������������ ��������� �������
model_5<-lm(data=ds3, �������~I(�����������_������^2)+�����������_������*�����_���������_������)
#� ����� � ���� �������� �������������� ������� � ������������� ����������� �� 0 �� 1
set.seed(0) #��� ��������� ���������� ������������������� �����
�����_���������_������_2<-sample(0:1,151, replace = T)
ds3<-cbind(ds3,�����_���������_������_2)
ds3$�����_���������_������_2<-as.factor(ifelse(ds3$�����_���������_������_2==1,"��","���"))
str(ds3)
ggplot(ds3, aes(x=(�����������_������)^2, y=�������, color=�����_���������_������_2))+geom_point()+stat_smooth(method="lm",formula = y~I(x^2))
model_6<-lm(data=ds3, �������~(I(�����������_������^2)+�����������_������)*�����_���������_������_2)
summary(model_6)
# ��� �� ��������� �������� ������������� �� ���������
#� ����� ������ �������� ������������� ���������� (p>0.05 � F-�������� < ������������)


#��������� �������� ������ ����������� ������� ������ �� ������� ��������� ����, ���������� ������������ ������, ���������� 
#������� � ������, ��������� �� ������ ������, ������������������� ���������� ����������
names(ds3)
#ggplot(ds3, aes(x=S_���������_����, y=�������))+geom_point()+stat_smooth(method="lm")
#ggplot(ds3, aes(x=����������_������������_������, y=�������))+geom_point()+stat_smooth(method="lm")
#ggplot(ds3, aes(x=�����������_������, y=�������))+geom_point()+stat_smooth(method="lm")
#ggplot(ds3, aes(x=R_��_������, y=�������))+geom_point()+stat_smooth(method="lm")
model_7<-lm(data=ds3, �������~S_���������_����+����������_������������_������+�����������_������+R_��_������)
summary(model_7)
Regression(data = ds3,�������~S_���������_����+����������_������������_������+�����������_������+R_��_������)
#�� ���������, ����� ������� ����, �������� ������������� �� ���������. ��������, ��� ������ ���� �������, ��� ����� ��������
#� ���, ��� ��� ������� ������� � ���� ������������� ����������� ��� ������ �������, �������� �� ������
#������������� ������ ������ �� �������� ��������������


#��������� �������� ������ ����������� ������� ������ �� ������� ��������� ����, ���������� ������������ ������, ���������� 
#������� � ������, ��������� �� ������ ������, ������� � ������ ������� �������-������� � ���������� � ��������� ������ 
#� �������� ��������� ����������, ������������������� ���������� ����������
model_8<-lm(data=ds3, �������~S_���������_����+����������_������������_������+�����������_������+R_��_������+
              �������_�������_�������+�����_���������_������_2)
summary(model_8)
Regression(data = ds3,�������~S_���������_����+����������_������������_������+�����������_������+R_��_������+
             �������_�������_�������+�����_���������_������_2)
#����� �������� �� ��������� �������� ������������� �� ���������. ��������, ��� ������ ���� �������, ��� ����� ��������
#� ���, ��� ��� ������� ������� � ���� ������������� ����������� ��� ������ ��� �������� ��������, �������� �� ������
#��� ���������� ������� �� 1 ��. ������� ������ �� 22,2 ��
#��� ���������� ������ ������� ������� ������� ��������� �� 52986,3 ��
#���� ����� ��������� �� � ��������� ������ ������� ���� �� 3250,1 ��.
#������������� ������ ������ �� �������� ��������������
#�� ������������ 0,7 ���������� ������� ����������� �������� � ������

#��������� �������� ������ ����������� ������� ������ �� ������� ��������� ����, ���������� ������������ ������, 
#���������� ������� � ������, ��������� �� ������ ������, ������� � ������ ������� �������-������� ��� ��������� ����������, 
#�������� �� ������������ ����������� �� ���������� ������� � ������ � ���������� � ��������� ������ ��� ��������� ����������,
#�������� �� ������������ ����������� �� ��������� �� ������ ������, ������������������� ���������� ����������
model_9<-lm(data=ds3, �������~S_���������_����+����������_������������_������+�����������_������:�������_�������_�������
            +R_��_������:�����_���������_������_2)
summary(model_9)
Regression(data = ds3,�������~S_���������_����+����������_������������_������+�����������_������:�������_�������_�������
           +R_��_������:�����_���������_������_2)
#������ � ����� �������� ������������� ��������, �� �������
#���������� ���������� ������������ ������ �� �������������, �.�. ���������� �������� �������
#������� ������ ��� ���������� ����������� � ������� ������� ������� ������������� �� 3375,9 ��.
#����������� ����������� ��������� ��� ������� ������� �� ������� ������ �� �������������, �.�. � ���� ������ ��� ��������� �� 117,7 ��.
#���������� �� ������ �������� �� �������� ��������� ��� ������� ���������� �� ����, ��������� �� ����� � ��������� ������
#��� ���������� ���������� �� ������ � ���������� � ��������� ������ ������� ��������� �� 848,5 ��, 
#��� ���������� �� � ��������� ������ ������� ��������� �� 1124,7 ��.
#�� ������������ ����� 0,622


#��������� ������ ����������� ������� ������ �� ��������� ������� ��������� ����, ���������� ������������ ������, 
#�������� ���������� ������� � ������, ��������, �������� ��������� �� ������ ������, ������� � ������ ������� �������-�������
#��� ��������� ���������� � ���������� � ��������� ������ ��� ��������� ����������, � ������ ����� ����� ����, 
#������������������� ���������� ����������
model_10<-lm(data=ds3, �������~I(log(S_���������_����))+����������_������������_������+I((�����������_������)^2)+
               I(1/R_��_������)+�������_�������_�������:�����_���������_������_2)
summary(model_10)
#������������� �� ��������� �������� �������: ���-�� ������������ ������, ������� ����������� ������, �������� ����������
#�� ������ ������ � ���������� ������ ������� ������� ��� ���������� ������  � ��������� ������.
#� ������� ����������� �������� ������ ������� �������:��� ��� ���������� ���������� ������
#� ����� ������ �������� ������������� ��������
#�� ������������ ����� 0,7145
#���������� ������� �� ������ �� ����������� ���������� ��������� ����� ������ ��� ������� ������� ������� � ��������� ������, ��� ���� 60608 ��. �������

