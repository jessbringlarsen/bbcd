
/**

  http://teethgrinder.co.uk/open-flash-chart/tutorial-js.php

  var so = new SWFObject("open-flash-chart.swf", "ofc", "400", "250", "9", "#FFFFFF");
  so.addVariable("variables","true");
  so.addVariable("title","Paper+Mario%23comma%23+%25+complete,{font-size: 18px; color: #A0A0A0;}");
  so.addVariable("x_legend","Week+1,12,#A0A0A0");
  so.addVariable("x_label_style","10,#A0A0A0,0,1");
  so.addVariable("x_axis_steps","1");
  so.addVariable("y_label_style","10,#A0A0A0");
  so.addVariable("y_ticks","5,10,2");
  so.addVariable("x_labels","Mon,Tue,Wed,Thu,Fri,Sat,Sun");
  so.addVariable("y_min","0");
  so.addVariable("y_max","100");
  so.addVariable("x_axis_colour","#A0A0A0");
  so.addVariable("x_grid_colour","#FFFFFF");
  so.addVariable("y_axis_colour","#A0A0A0");
  so.addVariable("y_grid_colour","#FFFFFF");
  so.addVariable("tool_tip","Progress%23comma%23+%23val%23%25");
  so.addVariable("bar_sketch","50,6,#99FF00,#7030A0,%25+Complete,10");
  so.addVariable("values","50,65,70,75,80,89,100");
  so.write("my_chart1");


 **/
class GraphTagLib {

    static namespace = 'chart' //Open Flash Chart

    def random = new Random()

    def pie = { attrs, body ->
        println attrs

        println "  *********************** pie "

        String alpha = attrs.alpha ?: 60
        String line_color = attrs.line_color ?: "#505050"
        String label_color = attrs.label_color ?: "#000000"

        attrs.pie = "${alpha},${line_color},${label_color}"
        attrs.colours = attrs.pie_slice_colours
        attrs.values = attrs.pie_values

        attrs.remove('alpha')
        attrs.remove('line_color')
        attrs.remove('label_color')
        attrs.remove('pie_slice_colours')
        attrs.remove('pie_values')

        out << generateChartGeneralData(attrs)
        if (attrs.src) {
            out << viewsource(attrs)
        }
    }

    def graph = { attrs, body ->
        out << generateChartGeneralData(attrs)
        if (attrs.src) {
            out << viewsource(attrs)
        }
    }

    /**
     * Helper method to generate the chart body data.
     * @param attrs tag lib attributes
     */
     def String generateChartGeneralData(attrs) {
         String path = "${request.contextPath}"
         if (pluginContextPath) {
        	 path = "${request.contextPath}${pluginContextPath}"
         }
        def swfSrc = "${path}/open-flash-chart.swf"

        StringBuffer output = new StringBuffer()

        def height = attrs.height ?: 300
        def width = attrs.width ?: 630
        def version = attrs.version ?: 9
        def bgColor = attrs.bg_colour ?: "%23ffffff"

        if (!attrs.divId) {
            attrs.divId = "graph_area_${random.nextLong()}"
            output << "<div id=\"${attrs.divId}\"></div>"
        }

        output << '<script type="text/javascript">'
        output << """var so = new SWFObject("${swfSrc}", "ofc", "${width}", "${height}", "${version}", "${bgColor}");"""

        output << generateNameValue(attrs)
        output << "so.write(\"${attrs.divId}\"); </script>"

        return output.toString()
     }

    /**
     * Helper method to generate the Name-Value pair
     * format string.
     * @param attrs tag lib attributes
     * @param ignoreList Pass in optional ignore list
     */
    def String generateNameValue(attrs, ignoreList=[]) {

        println "  ***************** generateNameValue "
        StringBuffer output = new StringBuffer()


        attrs.each { att ->
            if ("divId".equalsIgnoreCase(att.key)) { return }
            if ("src".equalsIgnoreCase(att.key)) { return }

            String values
            println "  ---  attrs type: [ ${att.value} ] "
            if (att.value instanceof List) {
                values = att.value.join(',')
                println "   * [INFO] Is a List type, so joined "
            } else if (att.value instanceof String) {
                values = att.value
                println "   * [INFO] Is a String type, so ignored"
            } else {
                log.warn("Unexpected type: \"${att.value}\"");
                values = att.value
            }

            output << """so.addVariable("${att.key}","${values.encodeAsURL()}");"""

        }


        output << getDefaultValues(attrs);

        if (!attrs.variables) {
             output << 'so.addVariable("variables","true");'
        }
        return output.toString()
    }


    /**
     * Set the default values if it's not set by the user.
     *  y_max="100"
     *  bg_colour="#ffffff"
     *  x_grid_colour="#F3f3f3"
     *  y_grid_colour="#F3f3f3"
     *  x_axis_colour="#999999"
     *  y_axis_colour="#999999"
     *  y_ticks="5,10,5"
     */
    String getDefaultValues(attrs) {
        StringBuffer result = new StringBuffer()

        if (!attrs.containsKey("bg_colour"))
             result << 'so.addVariable("bg_colour","%23ffffff");'

        if (!attrs.containsKey("y_max"))
             result << 'so.addVariable("y_max","100");'

     //   if (!attrs.containsKey("x_label_style"))
     //        result << 'so.addVariable("x_label_style","10,%23999999,2,0,%23999999");'

        if (!attrs.containsKey("x_grid_colour"))
             result << 'so.addVariable("x_grid_colour","%23f2f2f2");'

        if (!attrs.containsKey("y_grid_colour"))
             result << 'so.addVariable("y_grid_colour","%23f3f3f3");'

        if (!attrs.containsKey("y2_axis_colour"))
             result << 'so.addVariable("y2_axis_colour","%23999999");'

        if (!attrs.containsKey("y_axis_colour"))
             result << 'so.addVariable("y_axis_colour","%23999999");'

        if (!attrs.containsKey("x_axis_colour"))
             result << 'so.addVariable("x_axis_colour","%23999999");'

        if (!attrs.containsKey("inner_background"))
             result << 'so.addVariable("inner_background","%23ffffff");'

        if (!attrs.containsKey("y_ticks")) {
             result << 'so.addVariable("y_ticks","5,10,5");'
        } else {
             result << """so.addVariable("y_ticks","5,10,${attrs['y_ticks']}");"""
        }

     // if (!attrs.containsKey("inner_background"))
     //      result << 'so.addVariable("inner_background","%23ffffff,%23f6f6f6,90");'


        return result.toString()
    }

    /**
     * Generate the chart raw data source.
     * @param attrs tab lib attributes
     */
    def String viewsource(attrs) {
        println " *************** Viewsource "
        StringBuffer sb = new StringBuffer()
        attrs.each { key, value ->
            if ("divId".equalsIgnoreCase(key)) { return }
            if ("src".equalsIgnoreCase(key)) { return }
            sb << "&${key}=${value}&\n"
        }
        return sb.toString()
    }

    def includeSwfobject = {
         String path = "${request.contextPath}"
         if (pluginContextPath) {
        	 path = "${request.contextPath}${pluginContextPath}"
         }
        def href = "${path}/js/swfobject.js"
        out << "<script type=\"text/javascript\" src=\"${href}\"></script>"
    }

}

