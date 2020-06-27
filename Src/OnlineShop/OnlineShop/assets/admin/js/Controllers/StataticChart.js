

var chart = {
    init: function () {
        chart.registerEvents();
    },
    registerEvents: function () {


        //var yourValue = '@ViewBag.Statistical';
        //var myValue = $('#' + '@(ViewBag.Statistical)').val();


       // var statiticData = Html.Raw(Json.Encode(ViewBag.Statistical));
        var chart = new CanvasJS.Chart("chartContainer", {
            exportEnabled: true,
            animationEnabled: true,
            title: {
                text: "Doanh thu bán hàng theo tháng"
            },
            subtitles: [{
                text: "Đơn vị VNĐ"
            }],
            axisX: {
                title: "Tháng"
            },
            axisY: {
                title: "Tiền- VNĐ",
                titleFontColor: "#4F81BC",
                lineColor: "#4F81BC",
                labelFontColor: "#4F81BC",
                tickColor: "#4F81BC"
            },
            axisY2: {
                title: "Tiền- VNĐ",
                titleFontColor: "#C0504E",
                lineColor: "#C0504E",
                labelFontColor: "#C0504E",
                tickColor: "#C0504E"
            },
            toolTip: {
                shared: true
            },
            legend: {
                cursor: "pointer",
                itemclick: toggleDataSeries
            },
            data: [{
                type: "column",
                name: "Doanh thu",
                showInLegend: true,
                yValueFormatString: "#,##0.# Units",
                dataPoints: [
                    { label: "New Jersey", y: 19034.5 },
                    { label: "Texas", y: 20015 },
                    { label: "Oregon", y: 25342 },
                    { label: "Montana", y: 20088 },
                    { label: "Massachusetts", y: 28234 }
                ]
            },
            {
                type: "column",
                name: "Lợi nhuận",
                axisYType: "secondary",
                showInLegend: true,
                yValueFormatString: "#,##0.# Units",
                dataPoints: [
                    { label: "New Jersey", y: 210.5 },
                    { label: "Texas", y: 135 },
                    { label: "Oregon", y: 425 },
                    { label: "Montana", y: 130 },
                    { label: "Massachusetts", y: 528 }
                ]
            }]
        });
        chart.render();

        function toggleDataSeries(e) {
            if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
                e.dataSeries.visible = false;
            } else {
                e.dataSeries.visible = true;
            }
            e.chart.render();
        }


    }
}
chart.init();