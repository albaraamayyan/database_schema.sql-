-- ==========================================
-- أولاً: إدخال بيانات تجريبية
-- ==========================================
INSERT INTO customers (full_name, email, phone, city) VALUES
('سارة عبد الله', 'sara@email.com', '0501112233', 'الرياض'),
('محمد الشمري', 'mohammed@email.com', '0552223344', 'جدة'),
('فاطمة العمري', 'fatima@email.com', '0563334455', 'الدمام');

INSERT INTO products (product_name, category, price, stock_quantity) VALUES
('ساعة ذكية متطورة', 'إلكترونيات', 750.00, 50),
('سماعات لاسلكية عازلة للصوت', 'إلكترونيات', 350.00, 120),
('حقيبة ظهر جلدية', 'إكسسوارات', 220.00, 80);

INSERT INTO orders (customer_id, total_amount, order_status) VALUES
(1, 1100.00, 'قيد المعالجة');

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 750.00),
(1, 2, 1, 350.00);

-- ==========================================
-- ثانياً: استعلامات تحليلية وإدارية
-- ==========================================

-- عرض تفاصيل الطلبات مع أسماء العملاء
SELECT 
    o.order_id AS "رقم الطلب",
    c.full_name AS "اسم العميل",
    c.city AS "المدينة",
    o.total_amount AS "إجمالي المبلغ",
    o.order_status AS "حالة الطلب"
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id;

-- معرفة المنتجات التي تنفد من المخزون
SELECT 
    product_name AS "اسم المنتج",
    stock_quantity AS "الكمية المتبقية"
FROM products
WHERE stock_quantity < 60;

-- استعلام إحصائي لحساب إجمالي المبيعات حسب حالة الطلب
SELECT 
    order_status AS "حالة الطلب",
    COUNT(*) AS "عدد الطلبات",
    SUM(total_amount) AS "إجمالي المبيعات"
FROM orders
GROUP BY order_status;

-- ==========================================
-- ثالثاً: عمليات التعديل (UPDATE)
-- ==========================================
-- تحديث حالة الطلب
UPDATE orders 
SET order_status = 'تم الشحن' 
WHERE order_id = 1;

-- تعديل سعر منتج
UPDATE products 
SET price = 320.00 
WHERE product_id = 2;
