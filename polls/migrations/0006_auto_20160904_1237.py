# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0005_auto_20160830_0714'),
    ]

    operations = [
        migrations.AddField(
            model_name='grades',
            name='tech_note',
            field=models.CharField(max_length=200, default=''),
        ),
        migrations.AlterField(
            model_name='grades',
            name='exam_item',
            field=models.CharField(max_length=68),
        ),
    ]
