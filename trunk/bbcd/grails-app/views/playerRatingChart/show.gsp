<html>
    <body>
        <chart:includeSwfobject />
        <chart:graph line_hollow="2,4,0x80a033,Bounces,10"
                 title="${playerInfo} ,font-size: 20px; color: #736AFF"
                 x_labels="${ratingUpdateData}"
                 x_label_style="10,0x000000,0,1"
                 y_min="${minRating}"
                 y_max="${maxRating}"
                 y_label_steps="5"
                 is_thousand_separator_disabled="true"
                 set_is_fixed_num_decimals_forced="true"
                 set_num_decimals="0"
                 tool_tip="Rating: #val#"
                 values="${ratingData}"
                 width="500" height="300"
        />
    </body>
</html>