# Bright booking

This repository contains a Booking app to schedule daily tasks to employees. You can override them, daily or periodicaly.

## Technology Stack
This Boking system was built using Ruby on rails, and uses a Postgresql database to store the information.

## Setup
To run this APP on your local machine, follow these steps:
- Clone this repository: `git clone git@github.com:smargozzini/bright-booking.git`
- Navigate to the cloned repository: `cd bright-booking`
- Install the required packages: `bundle install`
- Setup database withj docker: `docker-compose up -d`
- Create the database: `rails db:create`
- Run the migrations: `rails db:migrate`
- Enter to the project console: `rails console`


## APP commands
- `ScheduleEventForEmployee`: To schedule a new event
- `ScheduleOverrideForEvent`: to override an existing event
- `PrintEventForRange`: to print events for a date range
- `PrintFullSchedule`: to print the full schedule for all the employees

### The homework commands are:

```ruby
ScheduleEventForEmployee.for(employee_id: 1, start_date: '2023-03-01', end_date: nil, start_time: '8:00', duration: 8)
ScheduleEventForEmployee.for(employee_id: 8, start_date: '2023-03-01', end_date: '2023-03-30', start_time: '6:00', duration: 7)

ScheduleOverrideForEvent.for(event_id: 1, override_type: 'TODAY_FORWARD', override_employee_id: 4, override_start_date: '2023-03-14', new_end_date: "2023-05-30", new_start_time: nil, new_duration: nil)
ScheduleOverrideForEvent.for(event_id: 1, override_type: 'TODAY_FORWARD', override_employee_id: 4, override_start_date: '2023-03-14', new_end_date: nil, new_start_time: "10:00", new_duration: nil)
ScheduleOverrideForEvent.for(event_id: 3, override_type: 'TODAY_FORWARD', override_employee_id: 7, override_start_date: '2023-03-21', new_end_date: "2023-4-10", new_start_time: nil, new_duration: 6.5)
ScheduleOverrideForEvent.for(event_id: 3, override_type: 'TODAY_FORWARD', override_employee_id: 8, override_start_date: '2023-04-01', new_end_date: nil, new_start_time: nil, new_duration: nil)
ScheduleOverrideForEvent.for(event_id: 4, override_type: 'TODAY_FORWARD', override_employee_id: 4, override_start_date: '2023-04-01', new_end_date: "2023-04-15", new_start_time: "7:00", new_duration: nil)

ScheduleOverrideForEvent.for(event_id: 2, override_type: 'TODAY_ONLY', override_employee_id: 2, override_start_date: '2023-03-07', new_end_date: nil, new_start_time: nil, new_duration: nil)
ScheduleOverrideForEvent.for(event_id: 2, override_type: 'TODAY_ONLY', override_employee_id: 2, override_start_date: '2023-03-08', new_end_date: nil, new_start_time: nil, new_duration: nil)
ScheduleOverrideForEvent.for(event_id: 2, override_type: 'TODAY_ONLY', override_employee_id: 3, override_start_date: '2023-03-08', new_end_date: nil, new_start_time: "5:00", new_duration: nil)
ScheduleOverrideForEvent.for(event_id: 2, override_type: 'TODAY_ONLY', override_employee_id: 3, override_start_date: '2023-03-10', new_end_date: nil, new_start_time: nil, new_duration: 9)
ScheduleOverrideForEvent.for(event_id: 2, override_type: 'TODAY_ONLY', override_employee_id: 3, override_start_date: '2023-03-14', new_end_date: nil, new_start_time: '9:00', new_duration: 4.5)

PrintEventForRange.for(start_date: "2023-02-04", num_days: 4)
PrintEventForRange.for(start_date: "2023-03-05", num_days: 6)
PrintEventForRange.for(start_date: "2023-02-27", num_days: 4)
PrintEventForRange.for(start_date: "2023-03-25", num_days: 10)
```
