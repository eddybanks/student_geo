require "test_helper"

describe StudentsController do
  let(:student) { students :one }

  it "gets index" do
    get students_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_student_url
    value(response).must_be :success?
  end

  it "creates student" do
    expect {
      post students_url, params: { student: { address: student.address, banner: student.banner, date_of_birth: student.date_of_birth, latitude: student.latitude, longitude: student.longitude } }
    }.must_change "Student.count"

    must_redirect_to student_path(Student.last)
  end

  it "shows student" do
    get student_url(student)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_student_url(student)
    value(response).must_be :success?
  end

  it "updates student" do
    patch student_url(student), params: { student: { address: student.address, banner: student.banner, date_of_birth: student.date_of_birth, latitude: student.latitude, longitude: student.longitude } }
    must_redirect_to student_path(student)
  end

  it "destroys student" do
    expect {
      delete student_url(student)
    }.must_change "Student.count", -1

    must_redirect_to students_path
  end
end
