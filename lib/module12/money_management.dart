import 'package:flutter/material.dart';

class MoneyManagement extends StatefulWidget {
  const MoneyManagement({super.key});

  @override
  State<MoneyManagement> createState() => _MoneyManagementState();
}

class _MoneyManagementState extends State<MoneyManagement>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Map<String, dynamic>> _earningList = [];
  final List<Map<String, dynamic>> _expenseList = [];
  double get totalExpense =>
      _earningList.fold(0, (sum, item) => sum + item['amount']);
  double get totalEarning =>
      _expenseList.fold(0, (sum, item) => sum + item['amount']);
  double get balance => totalEarning - totalExpense;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void addEntry(String title, double amount, DateTime date, bool isEarning) {
    setState(() {
      if (isEarning) {
        _earningList.add({'title': title, 'amount': amount, 'date': date});
      } else {
        _expenseList.add({'title': title, 'amount': amount, 'date': date});
      }
    });
  }

  void _showFavOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // << Important
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + 20,
            left: 20,
            right: 20,
            top: 20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: () {
                  Navigator.pop(context);
                  Future.delayed(Duration(milliseconds: 200), () {
                    _showForms(isEarning: true);
                  });
                },
                child: Text(
                  'Add earning',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {
                  Navigator.pop(context);
                  Future.delayed(Duration(milliseconds: 200), () {
                    _showForms(isEarning: false);
                  });
                },
                child: Text(
                  'Add expense',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showForms({required bool isEarning}) {
    TextEditingController titleController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    DateTime selectedDate = DateTime.now();

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom:
                MediaQuery.of(context).viewInsets.bottom +
                20, // handle keyboard
            left: 20,
            right: 20,
            top: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  isEarning ? "Add Earning" : "Add Expense",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isEarning ? Colors.green : Colors.red,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: "Enter title",
                    labelText: 'Title',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.type_specimen),
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: "Enter Amount",
                    labelText: 'Amount',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.money),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isEarning ? Colors.green : Colors.red,
                    ),
                    onPressed: () {
                      addEntry(
                        titleController.text,
                        double.parse(amountController.text),
                        selectedDate,
                        isEarning,
                      );
                      Navigator.pop(context);
                    },
                    child: Text(
                      isEarning ? "Add Earning" : "Add Expense",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Money Management'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Earning', icon: Icon(Icons.arrow_circle_up)),
            Tab(text: 'Expenses', icon: Icon(Icons.arrow_circle_down)),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              _moneyFlowCell(
                title: 'Earning',
                value: totalEarning,
                backColor: Colors.green,
              ),
              _moneyFlowCell(
                title: 'Expense',
                value: totalExpense,
                backColor: Colors.red,
              ),
              _moneyFlowCell(
                title: 'Balance',
                value: balance,
                backColor: Colors.orange,
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildList(
                  items: _earningList,
                  color: Colors.green,
                  isEarning: true,
                ),
                _buildList(
                  items: _expenseList,
                  color: Colors.red,
                  isEarning: false,
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showFavOptions(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget _moneyFlowCell({
  required String title,
  required double value,
  required Color backColor,
}) {
  return Expanded(
    child: Card(
      color: backColor,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              value.toString(),
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _buildList({
  required List<Map<String, dynamic>> items,
  required Color color,
  required bool isEarning,
}) {
  return ListView.builder(
    itemCount: items.length,

    itemBuilder: (context, index) {
      return Card(
        color: Colors.white,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: color.withAlpha(10),
            child: Icon(
              isEarning ? Icons.arrow_upward : Icons.arrow_downward,
              color: color,
            ),
          ),
          title: Text(items[index]['title']),
          subtitle: Text(items[index]['date'].toString()),
          trailing: Text(
            '৳ ${(items[index]['amount'].toString())}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
      );
    },
  );
}
