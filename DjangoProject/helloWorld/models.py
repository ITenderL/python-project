from django.db import models


# Create your models here.
class StudentInfo(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=20)
    age = models.IntegerField()

    class Meta:
        db_table = 't_student'


class BookTypeInfo(models.Model):
    id = models.AutoField(primary_key=True)
    bookTypeName = models.CharField(max_length=50, db_column='book_type_name')

    class Meta:
        db_table = 't_book_type'
        verbose_name = '图书类别信息'


class BookInfo(models.Model):
    id = models.AutoField(primary_key=True)
    bookName = models.CharField(max_length=100, db_column='book_name')
    price = models.DecimalField(max_digits=6, decimal_places=2)
    publishDate = models.DateField(db_column='publish_date')
    bookType = models.ForeignKey(BookTypeInfo, on_delete=models.PROTECT, db_column='book_type')

    class Meta:
        db_table = 't_book'
        verbose_name = '图书信息'


class AccountInfo(models.Model):
    id = models.AutoField(primary_key=True)
    user = models.CharField(max_length=20)
    account = models.FloatField()

    class Meta:
        db_table = 't_account'
        verbose_name = '用户账户信息'