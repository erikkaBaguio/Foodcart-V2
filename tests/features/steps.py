from lettuce import step, world, before
from nose.tools import assert_equals
from webtest import *
from app import app
from app.__init__ import *
import json

@before.all
def before_all():
    world.app = app.test_client()



"""Add new user"""

@step(u'Given I have the following user details:')
def user_details(step):
    world.user = step.hashes[0]


@step(u'When I click the register button')
def click_register_button(step):
    world.browser = TestApp(app)
    world.user_url = '/api/foodcart/users/signup/'
    world.response = world.app.post(world.user_url, data = json.dumps(world.user))

"""Add duplicate user"""
@step(u'And it should have a field "message" containing "ID ALREADY EXISTS"')
def message_error(step):
    world.resp = json.loads(world.response.data)
    assert_equals(world.resp['message'], "ID ALREADY EXISTS")