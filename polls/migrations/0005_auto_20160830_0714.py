# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0004_auto_20160830_0711'),
    ]

    operations = [
        migrations.CreateModel(
            name='Exam',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('exam_text', models.CharField(max_length=200)),
                ('grade', models.IntegerField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Grades',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('tech_name', models.CharField(max_length=50)),
                ('tech_type', models.CharField(max_length=50)),
                ('grade', models.IntegerField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='User',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('user_name', models.CharField(max_length=50)),
                ('pass_word', models.CharField(max_length=50)),
                ('e_mail', models.EmailField(max_length=254)),
                ('cell_phone', models.IntegerField()),
                ('work_place', models.CharField(max_length=50)),
                ('prof', models.BooleanField(default=False)),
            ],
        ),
        migrations.AddField(
            model_name='grades',
            name='author',
            field=models.ForeignKey(to='polls.User'),
        ),
        migrations.AddField(
            model_name='grades',
            name='exam_item',
            field=models.ForeignKey(to='polls.Exam'),
        ),
    ]
