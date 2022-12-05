require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do 
    @student = students(:one)
    @user = users(:one)
  end

  test 'should show student' do 
    get student_url(@student), as: :json
    assert_response :success

    json_response = JSON.parse(response.body)
    assert_equal @student.name, json_response['name']
  end

  test 'should show all users' do 
    get students_url, as: :json 
    assert_response :success
  end 

  test 'should create users ' do 
    assert_difference('Student.count') do 
    post students_url, params:{ student:{name:"student1", study:"b.tech", address:"vijayawada ibm"}},
                       headers: { Authorization: JsonWebToken.encode(user_id: @user.id)}, as: :json
    end
        assert_response :success
  end

  # test 'should update students when login' do 
  #   patch student_url(@student), params: { student: {name:"student 3"}},
  #                                headers: { Authorization: JsonWebToken.encode(user_id: @user.id)}, as: :json 
  #   assert_response :success
  # end
  
  # test 'should forhibt update student with out login' do 
  #   patch student_url(@student), params: { student: {name: "student"}},
  #                                as: :json
  #   assert_response :forbidden
  # end


  test 'should destroy student' do 
    assert_difference('Student.count', -1) do 
      delete student_url(@student)
    end
    assert_response :no_content
  end
 


end
