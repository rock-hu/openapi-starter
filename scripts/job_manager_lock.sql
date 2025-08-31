--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: job_manager_lock; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE job_manager_lock (
    instance_id character varying(20) NOT NULL,
    from_date timestamp with time zone NOT NULL,
    thru_date timestamp with time zone,
    reason_enum_id character varying(20),
    comments character varying(255),
    created_date timestamp with time zone,
    created_by_user_login character varying(255),
    last_modified_date timestamp with time zone,
    last_modified_by_user_login character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.job_manager_lock OWNER TO ofbiz;

--
-- Name: job_manager_lock pk_job_manager_lock; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY job_manager_lock
    ADD CONSTRAINT pk_job_manager_lock PRIMARY KEY (instance_id, from_date);


--
-- Name: jb_mngr_lck_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX jb_mngr_lck_txcrts ON job_manager_lock USING btree (created_tx_stamp);


--
-- Name: jb_mngr_lck_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX jb_mngr_lck_txstmp ON job_manager_lock USING btree (last_updated_tx_stamp);


--
-- Name: joblk_enum_reas; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX joblk_enum_reas ON job_manager_lock USING btree (reason_enum_id);


--
-- Name: job_manager_lock joblk_enum_reas; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY job_manager_lock
    ADD CONSTRAINT joblk_enum_reas FOREIGN KEY (reason_enum_id) REFERENCES enumeration(enum_id);


--
-- PostgreSQL database dump complete
--

