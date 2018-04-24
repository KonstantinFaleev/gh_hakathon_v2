# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Site.create({
                name: 'newsamerica',
                main_url: 'http://www.newsamerica.com/latest-news/',
                entry_list_tag: '.left-side-bar',
                entry_tag: '.post-contant',
                header_tag: '.post-contant h3',
                content_tag: '.post-contant',
                img_tag: 'p',
                img_attr: 'src'
            })
Site.create({
                name: 'Vox',
                main_url: 'https://www.vox.com/',
                entry_list_tag: '.c-compact-river',
                entry_tag: '.c-compact-river__entry',
                header_tag: '.c-page-title',
                content_tag: '.c-entry-content',
                img_tag: 'noscript img',
                img_attr: 'src'
            })
Site.create({
                name: 'Fox News',
                main_url: 'http://insider.foxnews.com/latest',
                entry_list_tag: '.stories.row',
                entry_tag: '.story',
                header_tag: '#page-title',
                content_tag: '.articleBody .field-items .field-item',
                img_tag: 'img.lazy-load',
                img_attr: 'data-src'
            })
Site.create({
                name: 'TheNews',
                main_url: 'https://www.thenews.com.pk/latest-stories/',
                entry_list_tag: '.writter-list-item.latestNews',
                entry_tag: 'ul li',
                header_tag: '.detail-heading h1',
                content_tag: '.story-detail',
                img_tag: 'img',
                img_attr: 'src'
            })
Site.create({
                name: 'TheNextWeb',
                main_url: 'https://thenextweb.com/latest',
                entry_list_tag: 'ul.u-row',
                entry_tag: 'li.u-col-xs-6.u-col-m-6.u-col-l-3',
                header_tag: 'header.post-header h1.u-m-0_25, header.c-post-header h1',
                content_tag: '.post-body, .c-formatted.c-post-content',
                img_tag: 'a',
                img_attr: 'data-src'
            })
Site.create({
                name: 'zmi.ck.ua',
                main_url: 'http://zmi.ck.ua/news',
                entry_list_tag: '.col-md-9',
                entry_tag: '.btn btn-primary btn-success',
                header_tag: 'span.glyphicon glyphicon-time.h2',
                content_tag: '.news-text',
                img_tag: 'img.img-responsive',
                img_attr: 'src'
            })