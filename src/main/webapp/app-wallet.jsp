<%
    Investor investor = (Investor) session.getAttribute("investor");
    if (investor == null) {
        session.setAttribute("message", "Please login to access");
        response.sendRedirect("investorlogin");
        return;
    }
%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="app-header.jsp" %>
    <div class="content-body">
        <div class="container-fluid">
            <div class="row page-titles mx-0">
                <div class="col-sm-6">
                    <div class="welcome-text">
                        <h4>Wallet Management</h4>
                        <span class="ml-1">Manage your wallet transactions below.</span>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="wallet-info">
                        <h5>Current Balance: ₹<span id="wallet-balance">5000</span></h5>
                    </div>
                    <div class="add-money">
                        <h5>Add Money to Wallet</h5>
                        <input type="number" id="amount" placeholder="Enter Amount" required>
                        <button class="btn btn-primary" onclick="addMoney()">Add Money</button>
                    </div>
                    <div class="withdraw-money mt-3">
                        <h5>Withdraw Money</h5>
                        <input type="number" id="withdraw-amount" placeholder="Enter Amount" required>
                        <button class="btn btn-warning" onclick="withdrawMoney()">Withdraw</button>
                    </div>
                    <h4 class="mt-4">Transaction History</h4>
                    <div class="transaction-filter mb-3">
                        <select id="transaction-type" onchange="filterTransactions()">
                            <option value="all">All Transactions</option>
                            <option value="deposit">Deposits</option>
                            <option value="withdrawal">Withdrawals</option>
                        </select>
                    </div>
                    <ul class="transaction-list">
                        <li class="transaction-item positive">
                            <span>Deposit: ₹500</span>
                            <span>2024-10-05</span>
                        </li>
                        <li class="transaction-item negative">
                            <span>Withdrawal: ₹200</span>
                            <span>2024-10-06</span>
                        </li>
                        <li class="transaction-item positive">
                            <span>Deposit: ₹1000</span>
                            <span>2024-10-07</span>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
<script src="./vendor/global/global.min.js"></script>
<script src="./js/quixnav-init.js"></script>
<script src="./js/custom.min.js"></script>

<script>
    function addMoney() {
        const amountInput = document.getElementById("amount");
        const amount = amountInput.value;
        const balanceElement = document.getElementById("wallet-balance");
        let currentBalance = parseFloat(balanceElement.textContent);

        if (amount && !isNaN(amount)) {
            const today = new Date().toISOString().split('T')[0];
            alert(`Added ₹${amount} to your wallet!`);

            // Update the balance
            currentBalance += parseFloat(amount);
            balanceElement.textContent = currentBalance.toFixed(2);

            // Add new transaction
            const transactionList = document.querySelector('.transaction-list');
            const transactionItem = document.createElement('li');
            transactionItem.className = 'transaction-item positive';
            transactionItem.innerHTML = `<span>Deposit: ₹${amount}</span><span>${today}</span>`;
            transactionList.appendChild(transactionItem);

            amountInput.value = '';
        } else {
            alert('Please enter a valid amount.');
        }
    }

    function withdrawMoney() {
        const withdrawAmountInput = document.getElementById("withdraw-amount");
        const amount = withdrawAmountInput.value;
        const balanceElement = document.getElementById("wallet-balance");
        let currentBalance = parseFloat(balanceElement.textContent);

        if (amount && !isNaN(amount) && currentBalance >= amount) {
            const today = new Date().toISOString().split('T')[0];
            alert(`Withdrew ₹${amount} from your wallet!`);

            // Update the balance
            currentBalance -= parseFloat(amount);
            balanceElement.textContent = currentBalance.toFixed(2);

            // Add new transaction
            const transactionList = document.querySelector('.transaction-list');
            const transactionItem = document.createElement('li');
            transactionItem.className = 'transaction-item negative';
            transactionItem.innerHTML = `<span>Withdrawal: ₹${amount}</span><span>${today}</span>`;
            transactionList.appendChild(transactionItem);

            withdrawAmountInput.value = '';
        } else {
            alert('Invalid withdrawal amount or insufficient balance.');
        }
    }

    function filterTransactions() {
        const filter = document.getElementById("transaction-type").value;
        const transactions = document.querySelectorAll('.transaction-item');

        transactions.forEach(transaction => {
            if (filter === 'all') {
                transaction.style.display = 'flex';
            } else if (filter === 'deposit' && transaction.classList.contains('positive')) {
                transaction.style.display = 'flex';
            } else if (filter === 'withdrawal' && transaction.classList.contains('negative')) {
                transaction.style.display = 'flex';
            } else {
                transaction.style.display = 'none';
            }
        });
    }
</script>
</body>
</html>
