# ----- Admin User ------ #
AdminUser.create!(email: 'anil@matabalasundri.com',
                  password: 'Anil@321',
                  password_confirmation: 'Anil@321')

#----- Organization ----- #
Organization.create(name: 'Mata Bala Sundri Enterprises',
                    email: 'matabalasundrienterprises.com',
                    address: 'Panipat',
                    phone_number: '+91-9874563210',
                    mobile_number: '+91-9632587410',
                    about_us: 'Best seller in the market.',
                    tag_line: 'Trust worthy',
                    latitude: '10',
                    longitude: '20',
                    social_links: {
                        facebook: 'https://www.facebook.com',
                        twitter: 'htts://www.twitter.com',
                        linkedin: 'https://www.linkedin.com',
                        google_plus: 'https://www.googleplus.com'
                    })

#----- categories ----- #
a = Category.create(name: 'BLANKETS')
Category.create([
                    {name: 'MINK', parent_id: a.id},
                    {name: 'POLAR FLEECE', parent_id: a.id},
                    {name: 'WOOLEN', parent_id: a.id},
                    {name: 'MAT FINISH', parent_id: a.id}
                ])

# ------ Properties ------- #
Property::Brand.create(name: 'MBSE')
Property::Color.create(name: 'Red')
Property::Size.create(name: 'Single Bed')
Property::Material.create(name: 'Woolen')