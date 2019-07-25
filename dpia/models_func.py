from django.db.models.functions import Concat
from django.db.models import Aggregate, CharField
class Concat(Aggregate):
    """ORM用来分组显示其他字段 相当于group_concat"""
    function = 'GROUP_CONCAT'
    template = '%(function)s(%(distinct)s%(expressions)s)'
    def __init__(self, expression, distinct=False, **extra):
        super(Concat, self).__init__( expression, distinct='DISTINCT ' if distinct else '', output_field=CharField(), **extra)
