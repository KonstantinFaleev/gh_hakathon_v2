# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Parser.create({
                name: 'TNW',
                main_url: 'https://thenextweb.com/latest',
                record_list_tag: 'ul.u-row',
                record_tag: 'li.u-col-xs-6.u-col-m-6.u-col-l-3',
                header_tag: 'header.post-header h1.u-m-0_25, header.c-post-header h1',
                content_tag: '.post-body, .c-formatted.c-post-content',
                img_tag: 'a',
                img_attr: 'data-src'
            })