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
  :deadline => '2015-10-20 00:00:00',
  :detail   => 'text text text text'
)
Event.create(
  :title    => 'event2',
  :owner    => 'owner2',
  :date     => '2015-11-25 00:00:00',
  :deadline => '2015-11-20 00:00:00',
  :detail   => 'text text text text'
)
Event.create(
  :title    => 'event3',
  :owner    => 'owner3',
  :date     => '2015-12-25 00:00:00',
  :deadline => '2015-12-20 00:00:00',
  :detail   => 'text text text text'
)
Participant.create(
  :event_id => 1,
  :user_id   => 1,
  :user_name => 'TOM',
  :status    => :unanswered,
)
Participant.create(
  :event_id => 1,
  :user_id   => 2,
  :user_name => 'BOB',
  :status    => :unanswered,
)
Participant.create(
  :event_id  => 1,
  :user_id   => 3,
  :user_name => 'JACK',
  :status    => :unanswered,
)

Participant.create(
  :event_id  => 2,
  :user_id   => 1,
  :user_name => 'TOM',
  :status    => :unanswered,
)
Participant.create(
  :event_id  => 2,
  :user_id   => 2,
  :user_name => 'BOB',
  :status    => :unanswered,
)
Participant.create(
  :event_id  => 2,
  :user_id   => 3,
  :user_name => 'JACK',
  :status    => :unanswered,
)

Participant.create(
  :event_id  => 3,
  :user_id   => 1,
  :user_name => 'TOM',
  :status    => :unanswered,
)
Participant.create(
  :event_id  => 3,
  :user_id   => 2,
  :user_name => 'BOB',
  :status    => :unanswered,
)
Participant.create(
  :event_id  => 3,
  :user_id   => 3,
  :user_name => 'JACK',
  :status    => :unanswered,
)

Comment.create(
  :event_id  => 1,
  :user_name => 'JACK',
  :text => 'comment comment comment',
)
