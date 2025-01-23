from django import forms
from django.forms import ModelForm, Form, widgets

from helloWorld.models import StudentInfo, BookTypeInfo, BookInfo


class StudentForm(ModelForm):
    class Meta:
        model = StudentInfo
        fields = ('name', 'age')
        widgets = {
            'name': forms.TextInput(attrs={'id': 'name', 'class': 'inputClass'}),
            'age': forms.NumberInput(attrs={'id': 'age'})
        }
        labels = {
            'name': '姓名',
            'age': '年龄'
        }


class BookInfoModelForm(ModelForm):
    class Meta:  # 配置中心
        model = BookInfo  # 导入model
        fields = '__all__'  # 代表所有字段
        # fields = ['name', 'age']
        widgets = {
            'bookName': forms.TextInput(attrs={'id': 'bookName', 'class': 'inputCls', "placeholder": "请输入用户名"})
        }

        labels = {  # 指定标签
            'bookName': '姓名',
            'price': '图书价格',
            'publishDate': '出版日期',
            'bookType': '图书类别',
        }
        help_texts = {
            'bookName': '请输入图书名称'
        }


class BookInfoForm(Form):
    """
    图书表单
    """
    bookName = forms.CharField(
        max_length=20,
        label="图书名称",
        required=True,
        widget=widgets.TextInput(attrs={"placeholder": "请输入用户名", "class": "inputCls"})
    )
    price = forms.FloatField(label="图书价格")
    publishDate = forms.DateField(label="出版日期")
    # 获取图书类别列表
    bookTypeList = BookTypeInfo.objects.values()
    # 图书类别以下拉框形式显示，下拉框选项id是图书类别Id，下拉框选项文本是图书类别名称
    choices = [(v['id'], v['bookTypeName']) for v, v in enumerate(bookTypeList)]
    bookType_id = forms.ChoiceField(choices=choices, label="图书类别")
