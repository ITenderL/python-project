from django import forms
from django.forms import ModelForm

from helloWorld.models import StudentInfo, BookTypeInfo


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


class BookInfoForm(ModelForm):
    """
    图书信息表单
    """
    bookName = forms.CharField(max_length=20, label='图书名称')
    price = forms.FloatField(label='图书加个')
    publishDate = forms.DateField(label='出版日期')
    # 获取图书类别列表
    bookTypeList = BookTypeInfo.objects.values()
    # 图书类别以下拉框的形式展示，下拉选项的id是图书类别id，下拉选项文本是图书类别名称
    choices = [(v['id'], v['bookTypeName']) for v, v in enumerate(bookTypeList)]
    bookType_id = forms.ChoiceField(required=False, choices=choices, label='图书类别')
