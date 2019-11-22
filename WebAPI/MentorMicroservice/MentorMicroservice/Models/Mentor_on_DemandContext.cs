using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

namespace MentorMicroservice.Models
{
    public partial class Mentor_on_DemandContext : DbContext
    {
        public Mentor_on_DemandContext()
        {
        }

        public Mentor_on_DemandContext(DbContextOptions<Mentor_on_DemandContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Mentor> Mentor { get; set; }
        public virtual DbSet<MentorSkills> MentorSkills { get; set; }
        public virtual DbSet<Skills> Skills { get; set; }
        public virtual DbSet<TblAdmin> TblAdmin { get; set; }
        public virtual DbSet<Trainings> Trainings { get; set; }
        public virtual DbSet<UserDtls> UserDtls { get; set; }
        public virtual DbQuery<TrainingsForMentor> TrainingsForMentors { get; set; }
        public virtual DbQuery<MentorSkillDetails> MentorSkillDetails { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            if (!optionsBuilder.IsConfigured)
            {
#warning To protect potentially sensitive information in your connection string, you should move it out of source code. See http://go.microsoft.com/fwlink/?LinkId=723263 for guidance on storing connection strings.
                optionsBuilder.UseSqlServer("Server=(local);Database=Mentor_on_Demand;Trusted_Connection=True;");
            }
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Mentor>(entity =>
            {
                entity.HasIndex(e => e.ContactNumber)
                    .HasName("UQ__Mentor__A1D1BF21C017D356")
                    .IsUnique();

                entity.HasIndex(e => e.Username)
                    .HasName("UQ__Mentor__F3DBC5728F36FE49")
                    .IsUnique();

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.ContactNumber).HasColumnName("contact_number");

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasColumnName("first_name")
                    .HasMaxLength(20);

                entity.Property(e => e.ForceResetPassword)
                    .HasColumnName("force_reset_password")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.LastName)
                    .HasColumnName("last_name")
                    .HasMaxLength(20);

                entity.Property(e => e.LinkedinUrl)
                    .HasColumnName("linkedin_url")
                    .HasMaxLength(100);

                entity.Property(e => e.MentorPassword)
                    .IsRequired()
                    .HasColumnName("mentor_password")
                    .HasMaxLength(16);

                entity.Property(e => e.RegCode)
                    .HasColumnName("reg_code")
                    .HasMaxLength(10)
                    .HasDefaultValueSql("('000')");

                entity.Property(e => e.RegDatetime)
                    .HasColumnName("reg_datetime")
                    .HasColumnType("datetime");

                entity.Property(e => e.Username)
                    .IsRequired()
                    .HasColumnName("username")
                    .HasMaxLength(20);

                entity.Property(e => e.YearsOfExperience).HasColumnName("years_of_experience");
            });

            modelBuilder.Entity<MentorSkills>(entity =>
            {
                entity.ToTable("Mentor_Skills");

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.FacilitiesOffered)
                    .HasColumnName("facilities_offered")
                    .HasMaxLength(100);

                entity.Property(e => e.MId).HasColumnName("m_id");

                entity.Property(e => e.SId).HasColumnName("s_id");

                entity.Property(e => e.SelfRating)
                    .HasColumnName("self_rating")
                    .HasColumnType("decimal(3, 1)");

                entity.Property(e => e.TrainingsDelivered).HasColumnName("trainings_delivered");

                entity.Property(e => e.YearsOfExp).HasColumnName("years_of_exp");

                entity.HasOne(d => d.M)
                    .WithMany(p => p.MentorSkills)
                    .HasForeignKey(d => d.MId)
                    .HasConstraintName("FK_MS_Mentor");

                entity.HasOne(d => d.S)
                    .WithMany(p => p.MentorSkills)
                    .HasForeignKey(d => d.SId)
                    .HasConstraintName("FK_MS_Skills");
            });

            modelBuilder.Entity<Skills>(entity =>
            {
                entity.HasIndex(e => e.SName)
                    .HasName("UQ__Skills__8D00F45A08A0F7DD")
                    .IsUnique();

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.Prerequisites)
                    .HasColumnName("prerequisites")
                    .HasMaxLength(100);

                entity.Property(e => e.SDurationHrs).HasColumnName("s_duration_hrs");

                entity.Property(e => e.SName)
                    .IsRequired()
                    .HasColumnName("s_name")
                    .HasMaxLength(30);

                entity.Property(e => e.SToc)
                    .HasColumnName("s_toc")
                    .HasMaxLength(20)
                    .HasDefaultValueSql("('000')");
            });

            modelBuilder.Entity<TblAdmin>(entity =>
            {
                entity.ToTable("Tbl_Admin");

                entity.HasIndex(e => e.Username)
                    .HasName("UQ__Tbl_Admi__F3DBC572E2CBDF5B")
                    .IsUnique();

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.AdPassword)
                    .IsRequired()
                    .HasColumnName("ad_password")
                    .HasMaxLength(16);

                entity.Property(e => e.Username)
                    .IsRequired()
                    .HasColumnName("username")
                    .HasMaxLength(20);
            });

            modelBuilder.Entity<Trainings>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.MentorId).HasColumnName("mentor_id");

                entity.Property(e => e.SkillId).HasColumnName("skill_id");

                entity.Property(e => e.Status)
                    .HasColumnName("status")
                    .HasMaxLength(15)
                    .HasDefaultValueSql("('Pending')");

                entity.Property(e => e.Userid).HasColumnName("userid");

                entity.HasOne(d => d.Mentor)
                    .WithMany(p => p.Trainings)
                    .HasForeignKey(d => d.MentorId)
                    .HasConstraintName("FK_Trainings_Mentor");

                entity.HasOne(d => d.Skill)
                    .WithMany(p => p.Trainings)
                    .HasForeignKey(d => d.SkillId)
                    .HasConstraintName("FK_Trainings_Skills");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Trainings)
                    .HasForeignKey(d => d.Userid)
                    .HasConstraintName("FK_Trainings_User");
            });

            modelBuilder.Entity<UserDtls>(entity =>
            {
                entity.HasIndex(e => e.ContactNumber)
                    .HasName("UQ__UserDtls__A1D1BF211889E60D")
                    .IsUnique();

                entity.HasIndex(e => e.Username)
                    .HasName("UQ__UserDtls__F3DBC57295240848")
                    .IsUnique();

                entity.Property(e => e.Id).HasColumnName("id");

                entity.Property(e => e.ContactNumber).HasColumnName("contact_number");

                entity.Property(e => e.FirstName)
                    .IsRequired()
                    .HasColumnName("first_name")
                    .HasMaxLength(20);

                entity.Property(e => e.ForceResetPassword)
                    .HasColumnName("force_reset_password")
                    .HasDefaultValueSql("((0))");

                entity.Property(e => e.LastName)
                    .HasColumnName("last_name")
                    .HasMaxLength(20);

                entity.Property(e => e.RegCode)
                    .HasColumnName("reg_code")
                    .HasMaxLength(10)
                    .HasDefaultValueSql("('000')");

                entity.Property(e => e.RegDatetime)
                    .HasColumnName("reg_datetime")
                    .HasColumnType("datetime");

                entity.Property(e => e.UserPassword)
                    .IsRequired()
                    .HasColumnName("user_password")
                    .HasMaxLength(16);

                entity.Property(e => e.Username)
                    .IsRequired()
                    .HasColumnName("username")
                    .HasMaxLength(20);
            });
        }
    }
}
