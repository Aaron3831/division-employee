require('spec_helper')

describe(Division) do
  describe("#employees") do
    it("tells which employees are assigned to it") do
      test_division = Division.create({:name => "IT"})
      test_employee1 = Employee.create({:name => "Quincy", :division_id => test_division.id})
      test_employee2 = Employee.create({:name => "Melody", :division_id => test_division.id})
     expect(test_division.employees()).to(eq([test_employee1, test_employee2]))
    end
  end
end
