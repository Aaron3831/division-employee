require("sinatra/activerecord")
require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/employee")
require("./lib/division")
require("pg")

get('/') do
  @employees = Employee.all()
  erb(:index)
end

post("/divisions") do
  name = params.fetch("name")
  division = Division.new({:name => name, :id => nil})
  division.save()
  erb(:division_success)
end

get('/divisions/new') do
  erb(:division_form)
end

get("/divisions/:id") do
  @division = Division.find(params.fetch("id").to_i())
  erb(:division)
end

get('/employees') do
  @employees = Employee.all()
  erb(:employees)
end

get('/divisions') do
  @divisions = Division.all()
  erb(:divisions)
end

post('/employees') do
  name = params.fetch("name")
  division_id = params.fetch("division_id").to_i()
  @division = Division.find(division_id)
  @employee = Employee.new({:name => name, :division_id => division_id})
  @employee.save()
  erb(:division_success)
end

get('/employees/:id/edit') do
  @employee = Employee.find(params.fetch("id").to_i())
  erb(:employee_edit)
end

patch("/employees/:id") do
  name = params.fetch("name")
  @employee = Employee.find(params.fetch("id").to_i())
  @employee.update({:name => name})
  @employees = Employee.all()
  erb(:index)
end
