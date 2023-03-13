
const sales = document.getElementById('salesChart');

const month_label = Array(4);

for (i = 0; i <= 4; i++) {
    month_label[i] = i + 1 + '월';
}

const salesData = {
    labels: month_label,
    datasets: [{
        type: 'line',
        label: '작년 매출',
        data: [10, 12, 20, 35, 36],
        fill: false,
        borderColor: 'RED',
        tension: 0.5
    }, {
        type: 'line',
        label: '올해 매출',
        data: [50, 48, 47, 46],
        fill: false,
        borderColor: 'BLUE',
        tension: 0.5
    }]
};

const salesChart = new Chart(sales, {
    type: 'scatter',
    data: salesData,
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        },
        responsive: false
    },
    hoverOffset: 5,
});



const doughnut = document.getElementById('doughnutChart');


const category = {
    labels: [
        '의류',
        '폰케이스',
        '홈데코',
        '액자'
    ],
    datasets: [{
        label: 'Sales',
        data: [20, 100, 50, 30],
        backgroundColor: [
            'rgba(255, 99, 132, 0.7)',
            'rgba(255, 159, 64, 0.7)',
            'rgba(255, 205, 86, 0.7)',
            'rgba(75, 192, 192, 0.7)'
        ],
        hoverOffset: 10,
        cutout: 30,
        radius: 60
    }]
};

const image = new Image();
image.src = '/jhc/assets/admin/images/admin.png';

const plugin = {
    id: 'customCanvasBackgroundImage',
    beforeDraw: (chartDoughnut) => {
        if (image.complete) {
            const ctx = chartDoughnut.ctx;
            const { top, left, width, height } = chartDoughnut.chartArea;
            const x = left + width / 2 - image.width / 2;
            const y = top + height / 2 - image.height / 2;                  
            ctx.drawImage(image, x, y);
        } else {
            image.onload = () => chartDoughnut.draw();
        }
    }
};

const chartDoughnut = new Chart(doughnut, {
    type: 'doughnut',
    data: category,
    plugins: [plugin],
    options: {
        responsive: false,
       
    }
});

const monthlySales = document.getElementById('barChart');

const monthlySalesData = {
    labels: month_label,
    datasets: [{
        type: 'bar',
        label: 'Jan',
        barPercentage: 0.1,
        data: [30, 50, 40, 80, 60],
        backgroundColor: [
            'rgba(255, 99, 132, 0.5)',
            'rgba(255, 159, 64, 0.2)',
            'rgba(255, 205, 86, 0.2)',
            'rgba(75, 192, 192, 0.2)',
            'rgba(54, 162, 235, 0.2)',
            'rgba(153, 102, 255, 0.2)',
            'rgba(201, 203, 207, 0.2)'
        ],
        borderColor: [
            'rgb(255, 99, 132)',
            'rgb(255, 159, 64)',
            'rgb(255, 205, 86)',
            'rgb(75, 192, 192)',
            'rgb(54, 162, 235)',
            'rgb(153, 102, 255)',
            'rgb(201, 203, 207)'
        ],
        borderWidth: 1
    }]
};

const monthlySalesChart = new Chart(monthlySales, {
    type: 'bar',
    data: monthlySalesData,
    options: {
        scales: {
            y: {
                beginAtZero: true
            }
        },
        responsive: false
    },
    borderWidth: 1,
    hoverOffset: 5,
});

const rateCompareLastMonth = document.getElementById('rateCompareLastMonthChart');

var lastMonth = 80;
var thisMonth = 60;
var rate = (thisMonth / lastMonth - 1) * 100;

var rateDate;

if (rate > 0) {
   rateData = {
        labels: ['전달대비'],
        datasets: [{
            label: '전달대비',
            data: [rate, (100 - rate)],
            backgroundColor: [
                'rgba(255, 99, 132, 0.7)',
                'rgb(110 110 115)'
            ],
            hoverOffset: 0,
            title: rate
        }]
    };
} else {
    rateData = {
        labels: ['전달대비'],
        datasets: [{
            label: '전달대비',
            data: [rate, (rate + 100)],
            backgroundColor: [
                'rgba(54, 162, 235, 0.7)',
                'rgb(110 110 115)'
            ],
            hoverOffset: 0,
            cutout: 50,
        	radius: 60,
            title: rate
        }]
    };
}

new Chart(rateCompareLastMonth, {
    type: 'doughnut',
    data: rateData,
    options: {
        responsive: false,
        legend: {
            rtl: true
        }
    }
});

const daily = document.getElementById('daily-chart');


const dailyData = {
    labels: [
        '후드티',
        '맨투맨',
        '반팔티'
    ],
    datasets: [{
        label: 'Sales',
        data: [300, 100, 50],
        backgroundColor: [
            'rgba(255, 99, 132, 0.7)',
            'rgba(255, 159, 64, 0.7)',
            'rgba(255, 205, 86, 0.7)',
        ],
        hoverOffset: 5,
    }]
};



const dailyChart = new Chart(daily, {
    type: 'doughnut',
    data: dailyData,
    options: {
        responsive: false
    }

});