class User < ApplicationRecord
  def self.find_for_session(session)
    u = find_or_create_by(id: session["id"]) do |user|
      user.first_name = session["first_name"]
      user.last_name = session["last_name"]
    end

    session['role_name'] = {
        '1' => 'student',
        '2' => 'ta',
        '3' => 'instructor',
        '4' => 'admin'
      }[session['role']]

      defaults = {
      "student" => false,
      "instructor" => false,
      "ta" => false,
      "admin" => false
    }

    defaults.each do |k, v|
      u.singleton_class.class_eval { attr_accessor k }
      u.instance_variable_set("@#{k}".to_sym, session["role_name"] == k)
    end

    # everything except the id and role from the session
    (session.keys-["id", "role"]).each do |key|
      value = session[key]
      u.singleton_class.class_eval { attr_accessor key }
      u.instance_variable_set("@#{key}".to_sym, value)
    end if u

    u
  end
end
