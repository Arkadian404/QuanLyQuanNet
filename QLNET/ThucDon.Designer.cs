namespace QLNET
{
    partial class ThucDon
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnInit = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnEdit = new System.Windows.Forms.Button();
            this.btnAdd = new System.Windows.Forms.Button();
            this.txtCL = new System.Windows.Forms.TextBox();
            this.txtDB = new System.Windows.Forms.TextBox();
            this.txtGT = new System.Windows.Forms.TextBox();
            this.txtTNL = new System.Windows.Forms.TextBox();
            this.txtTM = new System.Windows.Forms.TextBox();
            this.txtMM = new System.Windows.Forms.TextBox();
            this.lbCL = new System.Windows.Forms.Label();
            this.lbDB = new System.Windows.Forms.Label();
            this.lbGT = new System.Windows.Forms.Label();
            this.lbTNL = new System.Windows.Forms.Label();
            this.lbTM = new System.Windows.Forms.Label();
            this.lbMM = new System.Windows.Forms.Label();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btnInit);
            this.groupBox1.Controls.Add(this.btnDelete);
            this.groupBox1.Controls.Add(this.btnEdit);
            this.groupBox1.Controls.Add(this.btnAdd);
            this.groupBox1.Controls.Add(this.txtCL);
            this.groupBox1.Controls.Add(this.txtDB);
            this.groupBox1.Controls.Add(this.txtGT);
            this.groupBox1.Controls.Add(this.txtTNL);
            this.groupBox1.Controls.Add(this.txtTM);
            this.groupBox1.Controls.Add(this.txtMM);
            this.groupBox1.Controls.Add(this.lbCL);
            this.groupBox1.Controls.Add(this.lbDB);
            this.groupBox1.Controls.Add(this.lbGT);
            this.groupBox1.Controls.Add(this.lbTNL);
            this.groupBox1.Controls.Add(this.lbTM);
            this.groupBox1.Controls.Add(this.lbMM);
            this.groupBox1.Location = new System.Drawing.Point(12, 12);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(1121, 183);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Thông tin";
            this.groupBox1.Enter += new System.EventHandler(this.groupBox1_Enter);
            // 
            // btnInit
            // 
            this.btnInit.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.12727F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnInit.Location = new System.Drawing.Point(966, 118);
            this.btnInit.Name = "btnInit";
            this.btnInit.Size = new System.Drawing.Size(103, 33);
            this.btnInit.TabIndex = 2;
            this.btnInit.Text = "Khởi tạo";
            this.btnInit.UseVisualStyleBackColor = true;
            this.btnInit.Click += new System.EventHandler(this.btnInit_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.12727F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDelete.Location = new System.Drawing.Point(966, 28);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(103, 33);
            this.btnDelete.TabIndex = 2;
            this.btnDelete.Text = "Xóa";
            this.btnDelete.UseVisualStyleBackColor = true;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnEdit
            // 
            this.btnEdit.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.12727F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnEdit.Location = new System.Drawing.Point(423, 117);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(103, 33);
            this.btnEdit.TabIndex = 2;
            this.btnEdit.Text = "Sửa";
            this.btnEdit.UseVisualStyleBackColor = true;
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);
            // 
            // btnAdd
            // 
            this.btnAdd.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.12727F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAdd.Location = new System.Drawing.Point(423, 25);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(103, 33);
            this.btnAdd.TabIndex = 2;
            this.btnAdd.Text = "Thêm";
            this.btnAdd.UseVisualStyleBackColor = true;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // txtCL
            // 
            this.txtCL.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.12727F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCL.Location = new System.Drawing.Point(723, 121);
            this.txtCL.Name = "txtCL";
            this.txtCL.Size = new System.Drawing.Size(185, 27);
            this.txtCL.TabIndex = 1;
            this.txtCL.TextChanged += new System.EventHandler(this.txtDB_TextChanged);
            // 
            // txtDB
            // 
            this.txtDB.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.12727F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDB.Location = new System.Drawing.Point(723, 73);
            this.txtDB.Name = "txtDB";
            this.txtDB.Size = new System.Drawing.Size(185, 27);
            this.txtDB.TabIndex = 1;
            this.txtDB.TextChanged += new System.EventHandler(this.txtDB_TextChanged);
            // 
            // txtGT
            // 
            this.txtGT.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.12727F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtGT.Location = new System.Drawing.Point(723, 25);
            this.txtGT.Name = "txtGT";
            this.txtGT.Size = new System.Drawing.Size(185, 27);
            this.txtGT.TabIndex = 1;
            // 
            // txtTNL
            // 
            this.txtTNL.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.12727F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTNL.Location = new System.Drawing.Point(153, 123);
            this.txtTNL.Name = "txtTNL";
            this.txtTNL.Size = new System.Drawing.Size(185, 27);
            this.txtTNL.TabIndex = 1;
            // 
            // txtTM
            // 
            this.txtTM.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.12727F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTM.Location = new System.Drawing.Point(153, 74);
            this.txtTM.Name = "txtTM";
            this.txtTM.Size = new System.Drawing.Size(185, 27);
            this.txtTM.TabIndex = 1;
            // 
            // txtMM
            // 
            this.txtMM.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.12727F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMM.Location = new System.Drawing.Point(153, 28);
            this.txtMM.Name = "txtMM";
            this.txtMM.Size = new System.Drawing.Size(185, 27);
            this.txtMM.TabIndex = 1;
            // 
            // lbCL
            // 
            this.lbCL.AutoSize = true;
            this.lbCL.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.12727F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbCL.Location = new System.Drawing.Point(576, 126);
            this.lbCL.Name = "lbCL";
            this.lbCL.Size = new System.Drawing.Size(61, 20);
            this.lbCL.TabIndex = 0;
            this.lbCL.Text = "Còn lại";
            // 
            // lbDB
            // 
            this.lbDB.AutoSize = true;
            this.lbDB.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.12727F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbDB.Location = new System.Drawing.Point(576, 76);
            this.lbDB.Name = "lbDB";
            this.lbDB.Size = new System.Drawing.Size(62, 20);
            this.lbDB.TabIndex = 0;
            this.lbDB.Text = "Đã bán";
            // 
            // lbGT
            // 
            this.lbGT.AutoSize = true;
            this.lbGT.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.12727F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbGT.Location = new System.Drawing.Point(576, 28);
            this.lbGT.Name = "lbGT";
            this.lbGT.Size = new System.Drawing.Size(67, 20);
            this.lbGT.TabIndex = 0;
            this.lbGT.Text = "Giá tiền";
            // 
            // lbTNL
            // 
            this.lbTNL.AutoSize = true;
            this.lbTNL.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.12727F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbTNL.Location = new System.Drawing.Point(6, 126);
            this.lbTNL.Name = "lbTNL";
            this.lbTNL.Size = new System.Drawing.Size(130, 20);
            this.lbTNL.TabIndex = 0;
            this.lbTNL.Text = "Tiền nguyên liệu";
            // 
            // lbTM
            // 
            this.lbTM.AutoSize = true;
            this.lbTM.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.12727F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbTM.Location = new System.Drawing.Point(6, 77);
            this.lbTM.Name = "lbTM";
            this.lbTM.Size = new System.Drawing.Size(74, 20);
            this.lbTM.TabIndex = 0;
            this.lbTM.Text = "Tên món";
            // 
            // lbMM
            // 
            this.lbMM.AutoSize = true;
            this.lbMM.Font = new System.Drawing.Font("Microsoft Sans Serif", 11.12727F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbMM.Location = new System.Drawing.Point(6, 31);
            this.lbMM.Name = "lbMM";
            this.lbMM.Size = new System.Drawing.Size(69, 20);
            this.lbMM.TabIndex = 0;
            this.lbMM.Text = "Mã món";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.dataGridView1);
            this.groupBox2.Location = new System.Drawing.Point(12, 201);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(1121, 345);
            this.groupBox2.TabIndex = 0;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Danh sách";
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(7, 20);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 47;
            this.dataGridView1.Size = new System.Drawing.Size(1108, 319);
            this.dataGridView1.TabIndex = 0;
            // 
            // ThucDon
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.PaleTurquoise;
            this.ClientSize = new System.Drawing.Size(1145, 552);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Name = "ThucDon";
            this.Text = "ThucDon";
            this.Load += new System.EventHandler(this.ThucDon_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btnInit;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnEdit;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.TextBox txtDB;
        private System.Windows.Forms.TextBox txtGT;
        private System.Windows.Forms.TextBox txtTNL;
        private System.Windows.Forms.TextBox txtTM;
        private System.Windows.Forms.TextBox txtMM;
        private System.Windows.Forms.Label lbDB;
        private System.Windows.Forms.Label lbGT;
        private System.Windows.Forms.Label lbTNL;
        private System.Windows.Forms.Label lbTM;
        private System.Windows.Forms.Label lbMM;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label lbCL;
        private System.Windows.Forms.TextBox txtCL;
    }
}