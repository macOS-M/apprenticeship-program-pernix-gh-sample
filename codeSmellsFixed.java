public class Order {
    private String orderId;
    private double amount;

    public Order(String orderId, double amount) {
        this.orderId = orderId;
        this.amount = amount;
    }
    public double getAmount() {
        return amount;
    }
    public String getOrderId() {
        return orderId;
    }
}

public class Coupon {
    private String code;
    private double discount;

    public Coupon(String code, double discount) {
        this.code = code;
        this.discount = discount;
    }
    public double applyDiscount(double amount) {
        return amount * discount;
    }
    public String getCode() {
        return code;
    }
    public double getDiscount() {
        return discount;
    }
}

public class calculateDiscount {
    public double calculate(User user) {
    int loyaltyPoints = user.getLoyaltyPoints();
    double balance = user.getAccountBalance();
       if (loyaltyPoints > 200) {
        return balance * 0.2;
       } else if (loyaltyPoints > 100) {
        return balance * 0.1;
       } else {
        return balance * 0.05;
       }
    }
}
public class User {
    private ContactInfo contactInfo;
    private int loyaltyPoints;
    private double accountBalance;
    private List<Order> orders = new ArrayList<>();
    private List<Coupon> coupons = new ArrayList<>();

    public User(ContactInfo contactInfo, int loyaltyPoints, double accountBalance) {
        this.contactInfo = contactInfo;
        this.loyaltyPoints = loyaltyPoints;
        this.accountBalance = accountBalance;
    }
    public ContactInfo getContactInfo() {
        return contactInfo;
    }
    public int getLoyaltyPoints() {
        return loyaltyPoints;
    }
    public double getAccountBalance() {
        return accountBalance;
    }
    public List<Order> getOrders() {
        return orders;
    }
    public List<Coupon> getCoupons() {
        return coupons;
    }
    public void addOrder(Order order) {
        orders.add(order);
    }
    public void addCoupon(Coupon coupon) {
        coupons.add(coupon);
    }
    public void updateContactInfo(ContactInfo contactInfo) {
        this.contactInfo = contactInfo;
    }
}
/*
Code Smells detectados:
*Clase larga
*Obsesion por primitivos
*Data clumps
*Envidia de caracteristicas
*Exceso de comentarios
*Clases deprecadas
*Condicional defectuoso (el metodo para calcular el descuento no estaba implementado correctamente)

Explicación:
La clase User hacía de todo, se arregló de forma en que cada clase tenga su responsabilidad y se agrupó la información de contacto se agrupó dentro del objeto ContactInfo.
Las funciones que realizaba User que no pertenecían a su responsabilidad se movieron a clases distintas para reducir la envidia de caracteristicas.
Se eliminaron todos los comentarios, ya que no eran necesarios.
Se eliminaron las clases deprecadas.

