# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Event.create(
  :title    => 'event1',
  :owner    => 'owner1',
  :date     => '2015-10-25 00:00:00',
  :deadline => '2015-10-30 00:00:00',
  :detail   => 'text text text text'
)
Event.create(
  :title    => 'event2',
  :owner    => 'owner2',
  :date     => '2015-11-25 00:00:00',
  :deadline => '2015-11-30 00:00:00',
  :detail   => 'text text text text'
)
Event.create(
  :title    => 'event3',
  :owner    => 'owner3',
  :date     => '2015-12-25 00:00:00',
  :deadline => '2015-12-30 00:00:00',
  :detail   => 'text text text text'
)
Participant.create(
  :event_id => 1,
  :user_id   => 1,
  :user_name => 'userName1',
)
Participant.create(
  :event_id => 1,
  :user_id   => 2,
  :user_name => 'userName2',
  :status => :ancelled,
)

