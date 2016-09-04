# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0003_auto_20160828_1430'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='grades',
            name='author',
        ),
        migrations.RemoveField(
            model_name='grades',
            name='exam_item',
        ),
        migrations.DeleteModel(
            name='Exam',
        ),
        migrations.DeleteModel(
            name='Grades',
        ),
        migrations.DeleteModel(
            name='User',
        ),
    ]
