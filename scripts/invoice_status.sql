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
-- Name: invoice_status; Type: TABLE; Schema: public; Owner: ofbiz
--

CREATE TABLE invoice_status (
    status_id character varying(20) NOT NULL,
    invoice_id character varying(20) NOT NULL,
    status_date timestamp with time zone NOT NULL,
    change_by_user_login_id character varying(255),
    last_updated_stamp timestamp with time zone,
    last_updated_tx_stamp timestamp with time zone,
    created_stamp timestamp with time zone,
    created_tx_stamp timestamp with time zone
);


-- ALTER TABLE public.invoice_status OWNER TO ofbiz;

--
-- Name: invoice_status pk_invoice_status; Type: CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_status
    ADD CONSTRAINT pk_invoice_status PRIMARY KEY (status_id, invoice_id, status_date);


--
-- Name: inv_stts_usrlgn; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX inv_stts_usrlgn ON invoice_status USING btree (change_by_user_login_id);


--
-- Name: invc_stts_txcrts; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invc_stts_txcrts ON invoice_status USING btree (created_tx_stamp);


--
-- Name: invc_stts_txstmp; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invc_stts_txstmp ON invoice_status USING btree (last_updated_tx_stamp);


--
-- Name: invce_sts_invce; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invce_sts_invce ON invoice_status USING btree (invoice_id);


--
-- Name: invce_sts_stsitm; Type: INDEX; Schema: public; Owner: ofbiz
--

CREATE INDEX invce_sts_stsitm ON invoice_status USING btree (status_id);


--
-- Name: invoice_status inv_stts_usrlgn; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_status
    ADD CONSTRAINT inv_stts_usrlgn FOREIGN KEY (change_by_user_login_id) REFERENCES user_login(user_login_id);


--
-- Name: invoice_status invce_sts_invce; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_status
    ADD CONSTRAINT invce_sts_invce FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id);


--
-- Name: invoice_status invce_sts_stsitm; Type: FK CONSTRAINT; Schema: public; Owner: ofbiz
--

ALTER TABLE ONLY invoice_status
    ADD CONSTRAINT invce_sts_stsitm FOREIGN KEY (status_id) REFERENCES status_item(status_id);


--
-- PostgreSQL database dump complete
--

