/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/GUIForms/JFrame.java to edit this template
 */
package raven.application.form.other;

import javax.swing.JOptionPane;
import raven.application.Application;

import raven.application.model.KichCoModel;
import raven.application.service.KichCoService;

/**
 *
 * @author dungn
 */
public class FormKichThuoc extends javax.swing.JFrame {

    private KichCoService kcrs = new KichCoService();

    /**
     * Creates new form FormMauSac
     */
    public FormKichThuoc() {
        initComponents();
        this.setLocationRelativeTo(null);
        setTitle("Size");
    }

    private boolean validateFields() {
        String tenChatLieu = txtTenKichThuoc.getText().trim();
        String moTa = txtMoTa.getText().trim();

        if (tenChatLieu.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Vui lòng nhập tên size!");
            return false;
        }
        if (moTa.isEmpty()) {
            JOptionPane.showMessageDialog(this, "Vui lòng nhập mô tả size!");
            return false;
        }

        if (tenChatLieu.length() > 10) {
            JOptionPane.showMessageDialog(this, "Tên size tối đa là 10 ký tự!");
            return false;
        }

        if (moTa.length() > 254) {
            JOptionPane.showMessageDialog(this, "Mô tả tối đa là 254 ký tự!");
            return false;
        }

        return true;
    }
    
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated
    // Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        btnKichThuoc = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        txtTenKichThuoc = new javax.swing.JTextField();
        jLabel2 = new javax.swing.JLabel();
        jScrollPane1 = new javax.swing.JScrollPane();
        txtMoTa = new javax.swing.JTextArea();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);

        btnKichThuoc.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        btnKichThuoc.setText("Thêm");
        btnKichThuoc.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnKichThuocActionPerformed(evt);
            }
        });

        jLabel1.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel1.setText("Tên size:");

        txtTenKichThuoc.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N

        jLabel2.setFont(new java.awt.Font("Segoe UI", 0, 14)); // NOI18N
        jLabel2.setText("Mô tả");

        txtMoTa.setColumns(20);
        txtMoTa.setRows(5);
        jScrollPane1.setViewportView(txtMoTa);

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
                layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(layout.createSequentialGroup()
                                .addContainerGap()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                        .addComponent(btnKichThuoc)
                                        .addGroup(layout.createSequentialGroup()
                                                .addGroup(layout
                                                        .createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                                        .addGroup(layout.createSequentialGroup()
                                                                .addComponent(jLabel2)
                                                                .addGap(54, 54, 54))
                                                        .addGroup(javax.swing.GroupLayout.Alignment.LEADING, layout
                                                                .createSequentialGroup()
                                                                .addComponent(jLabel1)
                                                                .addPreferredGap(
                                                                        javax.swing.LayoutStyle.ComponentPlacement.RELATED)))
                                                .addGroup(layout
                                                        .createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING,
                                                                false)
                                                        .addComponent(txtTenKichThuoc,
                                                                javax.swing.GroupLayout.DEFAULT_SIZE, 287,
                                                                Short.MAX_VALUE)
                                                        .addComponent(jScrollPane1))))
                                .addContainerGap(19, Short.MAX_VALUE)));
        layout.setVerticalGroup(
                layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                        .addGroup(layout.createSequentialGroup()
                                .addGap(17, 17, 17)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                                        .addComponent(txtTenKichThuoc, javax.swing.GroupLayout.PREFERRED_SIZE,
                                                javax.swing.GroupLayout.DEFAULT_SIZE,
                                                javax.swing.GroupLayout.PREFERRED_SIZE)
                                        .addComponent(jLabel1))
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                        .addGroup(layout.createSequentialGroup()
                                                .addGap(28, 28, 28)
                                                .addComponent(jLabel2))
                                        .addGroup(layout.createSequentialGroup()
                                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE,
                                                        javax.swing.GroupLayout.DEFAULT_SIZE,
                                                        javax.swing.GroupLayout.PREFERRED_SIZE)))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, 24,
                                        Short.MAX_VALUE)
                                .addComponent(btnKichThuoc)
                                .addGap(21, 21, 21)));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void btnKichThuocActionPerformed(java.awt.event.ActionEvent evt) {// GEN-FIRST:event_btnKichThuocActionPerformed
        String tenKichCo = txtTenKichThuoc.getText();
        String moTa = txtMoTa.getText();
        if (kcrs.checkTrungTen(txtTenKichThuoc.getText().trim())) {
            JOptionPane.showMessageDialog(this, "Tên size đã tồn tại!");
            txtTenKichThuoc.requestFocus();
            return;
        }
        if (!validateFields()) {
            return;
        }
        KichCoService service = new KichCoService();
        String newID = service.getNewIDKC();
        KichCoModel kichCo = new KichCoModel(newID, tenKichCo, moTa);

        if (kcrs.insert(kichCo) > 0) {
            JOptionPane.showMessageDialog(this, "Thêm thành công !");
            Application.showForm(new FormSanPhamChiTiet());
        } else {
            JOptionPane.showMessageDialog(this, "Thêm thất bại!");
        }
    }// GEN-LAST:event_btnKichThuocActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        // <editor-fold defaultstate="collapsed" desc=" Look and feel setting code
        // (optional) ">
        /*
         * If Nimbus (introduced in Java SE 6) is not available, stay with the default
         * look and feel.
         * For details see
         * http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(FormKichThuoc.class.getName()).log(java.util.logging.Level.SEVERE, null,
                    ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(FormKichThuoc.class.getName()).log(java.util.logging.Level.SEVERE, null,
                    ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(FormKichThuoc.class.getName()).log(java.util.logging.Level.SEVERE, null,
                    ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(FormKichThuoc.class.getName()).log(java.util.logging.Level.SEVERE, null,
                    ex);
        }
        // </editor-fold>
        // </editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new FormKichThuoc().setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnKichThuoc;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTextArea txtMoTa;
    private javax.swing.JTextField txtTenKichThuoc;
    // End of variables declaration//GEN-END:variables
}
