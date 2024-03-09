# email: string
# password_digest: string

# has_secure_password, adds these
# password: string virtual
# password_confirmation: string virtual




class User < ApplicationRecord

    # password is sensitive, and this will make the password more secure & also not store the actual password or hash it and store.
    # store the virtual password & allow us to do the password_confirmation also
    has_secure_password

    validates :email, uniqueness: true, presence: true

end
