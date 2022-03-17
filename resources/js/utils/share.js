export const Share = {
    vk: function({purl, ptitle, pimg, ptext}) {
        let url = '';
        url  = 'http://vkontakte.ru/share.php?';
        url += 'url='          + encodeURIComponent(purl);
        url += '&title='       + encodeURIComponent(ptitle);
        url += '&description=' + encodeURIComponent(ptext);
        url += '&image='       + encodeURIComponent(pimg);
        url += '&noparse=true';
        this.popup(url);
    },
    ok: function({purl, ptext}) {
        let url = '';
        url  = 'http://www.odnoklassniki.ru/dk?st.cmd=addShare&st.s=1';
        url += '&st.comments=' + encodeURIComponent(ptext);
        url += '&st._surl='    + encodeURIComponent(purl);
        this.popup(url);
    },
    fb: function({purl, ptitle, pimg, ptext}) {
        let url = '';
        url  = 'http://www.facebook.com/sharer.php?s=100';
        url += '&p[title]='     + encodeURIComponent(ptitle);
        url += '&p[summary]='   + encodeURIComponent(ptext);
        url += '&p[url]='       + encodeURIComponent(purl);
        url += '&p[images][0]=' + encodeURIComponent(pimg);
        this.popup(url);
    },
    tw: function({purl, ptitle}) {
        let url = '';
        url  = 'http://twitter.com/share?';
        url += 'text='      + encodeURIComponent(ptitle);
        url += '&url='      + encodeURIComponent(purl);
        url += '&counturl=' + encodeURIComponent(purl);
        this.popup(url);
    },
    mr: function({purl, ptitle, pimg, ptext}) {
        let url = '';
        url  = 'http://connect.mail.ru/share?';
        url += 'url='          + encodeURIComponent(purl);
        url += '&title='       + encodeURIComponent(ptitle);
        url += '&description=' + encodeURIComponent(ptext);
        url += '&imageurl='    + encodeURIComponent(pimg);
        this.popup(url)
    },

    popup: function(url) {
        window.open(url,'','toolbar=0,status=0,width=626,height=436');
    }
};
