class User < ApplicationRecord
    geocoded_by :address
    after_validation :geocode
    
    has_many :questions, dependent: :nullify
    has_many :answers, dependent: :nullify
    has_many :job_posts, dependent: :nullify

    # has_and_belongs_to_many(
    #     :liked_questions, #this is the name that we want to give this association
    #     {
    #         class_name: "Question", #this is the name of the model we are associating with
    #         join_table: 'likes', #  Name of the join table
    #         association_foreign_key: 'question_id', #This is the name of the key that will act as the foreign key
    #         foreign_key: 'user_id' #    This is the name of the foreign key tyhat will be used as foreign key in the join table of this table
    #     }
    # )

    # Docs:
    # has_and_belongs_to_many(name, scope=nil, {options}, &extension)
    # The options are as follows:
    # :class_name => the model that the association points to
    # :join_table => the join table used to creat this association 
    # :foreign_key => on the join table, which foreign key points to this current model
    # :association_foreign_key => on the join table, which foreign key points to
    #   the associated table

    has_many :likes
    has_many :liked_questions, through: :likes, source: :question

    has_many :sent_gifts, class_name: 'Gift', foreign_key: :sender_id, dependent: :nullify
    has_many :received_gifts, class_name: 'Gift', foreign_key: :receiver_id, dependent: :nullify

    has_secure_password
    # What it needs
    # has_secure_password need password digest column in the database user table 
    # has_secured_password needs gem bcrypt

    # What it provides
    # validation: it will automatically add presence validation for the password field
    # Cross verify each other 'password' and 'password confirmation', so it will add 2 attribute accessors for the 'password' and password_confirmation
    # it is an optional but if we have this, has_secure_password will perform validation on it for us.
    # Once the password is validated and verified,it saves the password in an ecrypted form using brypt and stores in a db , in password_digest column for us
    # it will add a 'authenticate' method to verify user's password. if called with the correct password, it will return 'true' or 'false' based on if the password is correct or not

    VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, format: VALID_EMAIL_REGEX, unless: :from_oauth?

    def full_name
        "#{first_name} #{last_name}"
    end

    def from_oauth?
        uid.present? && provider.present?
    end

    def self.create_from_oauth(oauth_data)
        name = oauth_data["info"]["name"]&.split || oauth_data["info"]["nickname"]
        self.create(
            first_name: name[0],
            last_name: name[1] || "",
            uid: oauth_data["uid"],
            provider: oauth_data["provider"],
            oauth_raw_data: oauth_data,
            password: SecureRandom.hex(32)
        )
    end

    def self.find_by_oauth(oauth_data)
        self.find_by(
            uid: oauth_data["uid"],
            provider: oauth_data["provider"]
        )
    end

end
